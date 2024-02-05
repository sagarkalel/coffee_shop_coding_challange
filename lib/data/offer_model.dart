class OfferModel {
  final String discountOn;
  final double discount;
  final int minOrder;
  final double minPrice;

  const OfferModel({
    required this.discount,
    required this.minOrder,
    required this.minPrice,
    required this.discountOn,
  });
  factory OfferModel.fromMap(Map<String, dynamic> map) {
    String discountOn = 'order'; // order and delivery
    double minPrice = 5.0;
    double discount = 1.0;
    int minOrder = 1;

    if (map.containsKey("discount_on")) {
      discountOn = map['discount_on'] ?? '';
    }
    if (map.containsKey("min_order")) {
      minOrder = map['min_order'] ?? 1;
    }
    if (map.containsKey("min_price")) {
      minPrice = double.parse(map['min_price'].toString());
    }

    if (map.containsKey("discount")) {
      discount = double.parse(map['discount'].toString());
    }
    return OfferModel(
      minOrder: minOrder,
      minPrice: minPrice,
      discount: discount,
      discountOn: discountOn,
    );
  }
}
