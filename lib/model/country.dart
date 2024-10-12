class CountryModel {
  final String name;
  final String flag;
  final String mapUrl;

  CountryModel({
    required this.name,
    required this.flag,
    required this.mapUrl,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      name: json['name']['common'],
      flag: json['flags']['png'],
      mapUrl: json['maps']['googleMaps'],
    );
  }
}
