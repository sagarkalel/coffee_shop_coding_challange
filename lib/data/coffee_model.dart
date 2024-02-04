import 'package:first_challange_coffee_shop/data/banner_model.dart';

class CoffeModel {
  const CoffeModel({
    required this.coffeeType,
    required this.mixedWith,
    required this.price,
    required this.desc,
    required this.banner,
    required this.rating,
    required this.recentSearch,
    required this.isLiked,
    required this.id,
    required this.offerId,
    required this.ratingCount,
    required this.mixedWithIcons,
  });

  final String coffeeType;
  final String desc;
  final double price;
  final double rating;
  final String mixedWith;
  final Banner banner;
  final bool recentSearch;
  final bool isLiked;
  final String id;
  final String offerId;
  final int ratingCount;
  final List<String> mixedWithIcons;

  factory CoffeModel.fromMap(Map<String, dynamic> map) {
    String coffeeType = '';
    String desc = '';
    String mixedWith = '';
    String id = '';
    String offerId = '';
    double price = 0;
    double rating = 5;
    Banner banner = const Banner(desc: '', enable: false);
    bool recentSearch = false;
    bool isLiked = false;
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
    if (map.containsKey("offer_id")) {
      offerId = map['offer_id'] ?? '';
    }
    if (map.containsKey("mixed_with")) {
      mixedWith = map['mixed_with'] ?? '';
    }
    if (map.containsKey("price")) {
      price = double.parse(map['price'].toString());
    }
    if (map.containsKey("rating")) {
      rating = double.parse(map['rating'].toString());
    }
    if (map.containsKey("is_liked")) {
      isLiked = map['is_liked'] ?? false;
    }
    if (map.containsKey("recent_search")) {
      recentSearch = map['recent_search'] ?? false;
    }
    if (map.containsKey("banner")) {
      banner = map['banner'] ?? const Banner(desc: '', enable: false);
    }
    if (map.containsKey("rating_count")) {
      ratingCount = map['rating_count'] ?? 0;
    }
    if (map.containsKey("mixed_with_icons")) {
      if (map['mixed_with_icons'] != null) {
        mixedWithIcons = List<String>.from(map['mixed_with_icons']);
      }
    }

    return CoffeModel(
      coffeeType: coffeeType,
      mixedWith: mixedWith,
      price: price,
      desc: desc,
      banner: banner,
      rating: rating,
      recentSearch: recentSearch,
      isLiked: isLiked,
      id: id,
      offerId: offerId,
      ratingCount: ratingCount,
      mixedWithIcons: mixedWithIcons,
    );
  }
}
