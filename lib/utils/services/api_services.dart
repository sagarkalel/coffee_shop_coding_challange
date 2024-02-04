import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_challange_coffee_shop/data/coffee_model.dart';
import 'package:first_challange_coffee_shop/models/address_model.dart';
import 'package:first_challange_coffee_shop/provider/provider.dart';
import 'package:first_challange_coffee_shop/screens/otp_screen/otp_screen.dart';
import 'package:first_challange_coffee_shop/screens/sign_up_screen/sign_up_screen.dart';
import 'package:first_challange_coffee_shop/utils/components/snackbar.dart';
import 'package:first_challange_coffee_shop/utils/constatnts/routes_constants.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class ApiServices {
  static Future<bool> getLoaction() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // handle when permission denied
      debugPrint("permission is denied");
      return false;
    } else if (permission == LocationPermission.deniedForever) {
      // handel when permantly denied
      debugPrint("permission is denied forever");
      return true;
    } else if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      // store location here
      getLatlong();
      return true;
    }
    return false;
  }

  static Future<void> getLatlong() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    getCurrentPlacesFromLatlong(
        latitude: position.latitude, longitude: position.longitude);
  }

  static Future<void> getCurrentPlacesFromLatlong(
      {required double latitude, required double longitude}) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    Placemark place = placemarks[0];
    MyProvider().myLocality = "${place.locality}, ${place.subLocality}";
    debugPrint("this is locality: ${place.locality}, ${place.subLocality}");
    final id = DateTime.now().toString();
    MyProvider().addAddress = Address(
      landmark: "${place.administrativeArea}, ${place.subAdministrativeArea}",
      house: '${place.name}',
      id: id,
      locality: "${place.street}, ${place.locality}, ${place.subLocality}",
      receiverName: MyProvider().userName,
      receiverContact: MyProvider().phoneNumber,
    );
    if (MyProvider().inUsedAddress.isEmpty) MyProvider().inUsedAddress = id;
  }

  static String getInUsedLocality() {
    String locality = 'empty';
    if (MyProvider().addresses.isNotEmpty) {
      locality = MyProvider()
              .addresses
              .firstWhere((element) => element.id == MyProvider().inUsedAddress)
              .locality ??
          'No locality found';
      debugPrint("this is filtered inused locality: $locality");
    } else {
      locality = MyProvider().myLocality;
    }
    return locality;
  }

  static void sendOtp(
    context, {
    required String input,
    required MyProvider provider,
    bool isForResend = false,
  }) async {
    if (isForResend) {
      provider.isResending = true;
    }
    FirebaseAuth.instance.verifyPhoneNumber(
      verificationCompleted: (phoneAuthCredential) {},
      verificationFailed: (error) {
        // showSnackbar(context, text: error.toString());
        provider.isLoading = false;
        provider.isResending = false;
        debugPrint("error while sending otp: $error");
        showSnackbar(context,
            text:
                "Something went wrong, please try again or check entered phone number");
      },
      forceResendingToken: provider.forceResendingToken,
      phoneNumber: input,
      codeSent: (verificationId, token) {
        provider.isLoading = false;
        provider.forceResendingToken = token;
        provider.isResending = false;
        provider.startTimer();
        if (!isForResend) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OtpScreen(
                  phoneNumber: input,
                  verificationId: verificationId,
                  forceResendingToken: token,
                ),
              ));
        }
      },
      codeAutoRetrievalTimeout: (verificationId) {},
    );
  }

  static String phoneNumberToDisplay(String inputPhone) {
    String phone = '';
    phone = "${inputPhone.substring(0, 3)}-${inputPhone.substring(3)}";
    return phone;
  }

  static void verifyOtp(
    context, {
    required String otp,
    required String verificationId,
    required String phoneNumber,
    required MyProvider provider,
  }) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otp);
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) async {
        provider.uid = value.user?.uid;
        provider.canselTimer();
        provider.phoneNumber = phoneNumber;
        final user = await FirebaseFirestore.instance
            .collection("user")
            .doc(provider.uid)
            .get();
        debugPrint("this user is exist: ${user.exists}");
        if (!user.exists) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const SignupScreen(),
              ),
              (route) => false);
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, AppRoutes.dashboardScreen, (route) => false);
        }
        provider.isLoading = false;
      });
    } catch (e) {
      provider.isLoading = false;
      showSnackbar(context, text: "Please enter valid OTP code");
      debugPrint("error while verifying otp: $e");
    }
  }

  static Future<void> createUserAccount(
    context, {
    required String name,
    required MyProvider provider,
  }) async {
    provider.isLoading = true;
    try {
      CollectionReference user = FirebaseFirestore.instance.collection("user");
      await user.doc(provider.uid).set({
        'name': name,
        'phone': provider.phoneNumber,
        'uid': provider.uid,
        'image': '',
      });
      Navigator.pushNamed(context, AppRoutes.dashboardScreen);
      provider.isLoading = false;
    } catch (e) {
      provider.isLoading = false;
      showSnackbar(context, text: "Something went wrong: $e");
    }
  }

  static Future<String> addCoffee(context,
      {required Map<String, dynamic> data}) async {
    try {
      CollectionReference coffee =
          FirebaseFirestore.instance.collection("coffee");
      final result = await coffee.add(data);
      result.update({'id': result.id});
      return result.id;
    } catch (e) {
      showSnackbar(context, text: "error while adding coffee: $e");
      debugPrint("error while adding coffee: $e");
      return '';
    }
  }

  // static Stream<List<CoffeModel>> getCoffeeStream() {
  //   Stream<QuerySnapshot<Map<String, dynamic>>> coffeeCollection =
  //       FirebaseFirestore.instance.collection("coffee").snapshots();

  //   return coffeeCollection.map((event) {
  //     try {
  //       return event.docs.map((doc) {
  //         return CoffeModel.fromMap(doc.data());
  //       }).toList();
  //     } catch (e) {
  //       debugPrint("getting error while streaming coffee data: $e");
  //       return [];
  //     }
  //   });
  // }

  static Future<List<CoffeModel>> getCoffeesFuture() async {
    List<CoffeModel> allCoffees = [];
    MyProvider provider = MyProvider();
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance.collection("coffee").get();
      allCoffees = querySnapshot.docs
          .map((doc) => CoffeModel.fromMap(doc.data()))
          .toList();
      provider.allCoffees = allCoffees;
      return allCoffees;
    } catch (e) {
      debugPrint("getting error while streaming coffee data: $e");
      provider.allCoffees = allCoffees;
      return allCoffees;
    }
  }

  // static Stream<CoffeModel?> getCoffeeStreamFromId(String id) {
  //   var coffeeCollection =
  //       FirebaseFirestore.instance.collection("coffee").doc(id).snapshots();

  //   return coffeeCollection.map((event) {
  //     try {
  //       if (event.exists) {
  //         return CoffeModel.fromMap(event.data() as Map<String, dynamic>);
  //       } else {
  //         return null;
  //       }
  //     } catch (e) {
  //       debugPrint("getting error while streaming coffee data: $e");
  //       return null;
  //     }
  //   });
  // }

  static Future<List<String>> getAllLikedCoffes() async {
    List<String> allLikedCoffees = [];
    MyProvider provider = MyProvider();
    try {
      var userDoc = await FirebaseFirestore.instance
          .collection('user')
          .doc(MyProvider().uid)
          .get();
      if (userDoc.data() != null &&
          userDoc.data()!.containsKey("liked_coffees")) {
        allLikedCoffees = List<String>.from(userDoc.data()!['liked_coffees']);
        provider.allLikedCoffees = allLikedCoffees;
        debugPrint("these are all liked coffes: $allLikedCoffees");
        return allLikedCoffees;
      } else {
        provider.allLikedCoffees = allLikedCoffees;
        debugPrint(
            "these are all liked coffes but got null or not contains: ${MyProvider().uid}");
        return allLikedCoffees;
      }
    } catch (e) {
      debugPrint("error is getting while gettin likedCoffees: $e");
      provider.allLikedCoffees = allLikedCoffees;
      return allLikedCoffees;
    }
  }

  static Future<void> updateFavoriteCoffee(String coffeeId) async {
    try {
      MyProvider().updateFavoriteCoffee(coffeeId);
      var userDoc = await FirebaseFirestore.instance
          .collection("user")
          .doc(MyProvider().uid)
          .get();
      if (userDoc.data() != null &&
          userDoc.data()!.containsKey("liked_coffees")) {
        List<String> allLikedCoffes =
            List<String>.from(userDoc.data()!['liked_coffees']);

        if (allLikedCoffes.contains(coffeeId)) {
          allLikedCoffes.remove(coffeeId);
        } else {
          allLikedCoffes.add(coffeeId);
        }
        await userDoc.reference.update({'liked_coffees': allLikedCoffes});
      } else if (userDoc.data() != null) {
        var doc =
            FirebaseFirestore.instance.collection("user").doc(MyProvider().uid);
        doc.set({
          'liked_coffees': [coffeeId]
        });
      }
      debugPrint("added to favorite successfully");
    } catch (e) {
      debugPrint("error getting while adding favorite: $e");
    }
  }

  static bool isGivenCoffeeIdLiked(
      {required String coffeeId, required MyProvider provider}) {
    if (provider.allLikedCoffees.isEmpty) {
      return false;
    } else {
      return provider.allLikedCoffees.contains(coffeeId);
    }
  }
}
