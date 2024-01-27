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
    String address =
        "name: ${place.name}, \n administrativeArea: ${place.administrativeArea}, locality: ${place.locality}, street: ${place.street}, postalCode: ${place.postalCode}, subAdministrativeArea: ${place.subAdministrativeArea}, subLocality: ${place.subLocality}, thoroughfare: ${place.thoroughfare}, subThoroughfare: ${place.subThoroughfare}, ${place.country}";
    debugPrint("this is address which we got: $address");
  }
}
