class Banner {
  final String desc;
  final bool enable;

  const Banner({required this.desc, required this.enable});

  factory Banner.fromMap(Map<String, dynamic> map) {
    String desc = '';
    bool enable = false;
    if (map.containsKey("desc")) {
      desc = map['desc'] ?? '';
    }
    if (map.containsKey("enable")) {
      enable = map['enable'] ?? false;
    }
    return Banner(
      desc: desc,
      enable: enable,
    );
  }
}
