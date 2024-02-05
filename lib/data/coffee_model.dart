import 'package:first_challange_coffee_shop/data/banner_model.dart';
import 'package:first_challange_coffee_shop/data/price_model.dart';

class CoffeeModel {
  const CoffeeModel({
    required this.coffeeType,
    required this.mixedWith,
    required this.price,
    required this.desc,
    required this.banner,
    required this.rating,
    required this.recentSearch,
    required this.id,
    required this.offerId,
    required this.ratingCount,
    required this.mixedWithIcons,
    required this.image,
    required this.deliveryFee,
  });

  final String coffeeType;
  final String desc;
  final double rating;
  final double deliveryFee;
  final String mixedWith;
  final Banner banner;
  final bool recentSearch;
  final String id;
  final String image;
  final String offerId;
  final int ratingCount;
  final List<String> mixedWithIcons;
  final Price price;

  factory CoffeeModel.fromMap(Map<String, dynamic> map) {
    String coffeeType = '';
    String desc = '';
    String mixedWith = '';
    String id = '';
    String offerId = '';
    String image = '';
    Price price = const Price(s: 1.0, m: 2.0, l: 3.0);
    double rating = 5;
    double deliveryFee = 1.5;
    Banner banner = const Banner(desc: '', enable: false);
    bool recentSearch = false;
    int ratingCount = 0;
    List<String> mixedWithIcons = [];

    if (map.containsKey("coffee_type")) {
      coffeeType = map['coffee_type'] ?? '';
    }
    if (map.containsKey("desc")) {
      desc = map['desc'] ?? '';
    }
    if (map.containsKey("id")) {
      id = map['id'] ?? '';
    }
    if (map.containsKey("delivery_fee")) {
      deliveryFee = double.parse(map['delivery_fee'].toString());
    }
    if (map.containsKey("offer_id")) {
      offerId = map['offer_id'] ?? '';
    }
    if (map.containsKey("mixed_with")) {
      mixedWith = map['mixed_with'] ?? '';
    }
    if (map.containsKey("price")) {
      price =
          Price.fromMap(map['price'] ?? const Price(s: 1.0, m: 2.0, l: 3.0));
    }
    if (map.containsKey("rating")) {
      rating = double.parse(map['rating'].toString());
    }
    if (map.containsKey("recent_search")) {
      recentSearch = map['recent_search'] ?? false;
    }
    if (map.containsKey("banner")) {
      banner = Banner.fromMap(
          map['banner'] ?? const Banner(desc: '', enable: false));
    }
    if (map.containsKey("rating_count")) {
      ratingCount = map['rating_count'] ?? 0;
    }
    if (map.containsKey("mixed_with_icons")) {
      if (map['mixed_with_icons'] != null) {
        mixedWithIcons = List<String>.from(map['mixed_with_icons']);
      }
    }
    if (map.containsKey('image')) {
      image = map['image'] ?? '';
    }

    return CoffeeModel(
      coffeeType: coffeeType,
      mixedWith: mixedWith,
      price: price,
      desc: desc,
      banner: banner,
      rating: rating,
      recentSearch: recentSearch,
      id: id,
      offerId: offerId,
      ratingCount: ratingCount,
      mixedWithIcons: mixedWithIcons,
      image: image,
      deliveryFee: deliveryFee,
    );
  }
}
