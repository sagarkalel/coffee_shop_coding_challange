class Address {
  late AddressType type;
  late String? receiverName;
  late String? receiverContact;
  late String? locality;
  late String landmark;
  late String house;
  final String id;
  Address({
    required this.landmark,
    required this.house,
    required this.id,
    this.type = AddressType.home,
    this.receiverName,
    this.receiverContact,
    this.locality,
  });
}

enum AddressType { home, work, hotel }
