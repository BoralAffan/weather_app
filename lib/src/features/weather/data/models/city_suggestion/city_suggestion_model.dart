class CitySuggestionModel {
  final String? name;
  final String? countryCode;
  final String? countryName;
  final double? lat;
  final double? lon;

  CitySuggestionModel({
    required this.name,
    required this.lat,
    required this.lon,
    required this.countryCode,
    required this.countryName
  });

  factory CitySuggestionModel.fromJson(Map<String, dynamic> json) {
    return CitySuggestionModel(
      name: json['name'],
      lat: json['lat'],
      lon: json['lng'],
      countryCode: json['countryCode'],
      countryName: json['countryName']
    );
  }
}
