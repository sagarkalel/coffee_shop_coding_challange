class Price {
  final double s;
  final double m;
  final double l;
  const Price({required this.s, required this.m, required this.l});
  factory Price.fromMap(Map<String, dynamic> map) {
    double s = 1.0;
    double m = 2.0;
    double l = 3.0;
    if (map.containsKey("s")) {
      s = double.parse(map['s'].toString());
    }
    if (map.containsKey("m")) {
      m = double.parse(map['m'].toString());
    }
    if (map.containsKey("l")) {
      l = double.parse(map['l'].toString());
    }

    return Price(
      s: s,
      m: m,
      l: l,
    );
  }
}
