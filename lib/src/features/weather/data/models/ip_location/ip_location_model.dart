class IPLocation {
  final String city;

  IPLocation({required this.city});

  factory IPLocation.fromJson(Map<String, dynamic> json) {
    return IPLocation(city: json['city']);
  }
}