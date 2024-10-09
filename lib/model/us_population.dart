class UsModel {
  final String year;
  final String count;

  UsModel(this.year, this.count);

  factory UsModel.fromJson(Map<String, dynamic> json) {
    return UsModel(json["Year"], json["Population"].toString());
  }
}
