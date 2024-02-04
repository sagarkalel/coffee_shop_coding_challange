class OfferModel {
  final String offerId;
  final String title;
  final List<String> points;
  final int discount;
  final int minOrder;
  final int minPrice;

  const OfferModel({
    required this.discount,
    required this.offerId,
    required this.points,
    required this.title,
    required this.minOrder,
    required this.minPrice,
  });
}
