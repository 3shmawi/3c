import 'package:flutter/cupertino.dart';

abstract class AppConstants {
  static const _baseUrl = "https://newsapi.org/v2";
  static const _apiKey = "2fbf9799a7fb47c88f266c543fb36a78";

  static searchApi(String word) =>
      "$_baseUrl/everything?q=$word&from=${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day - 1}&sortBy=publishedAt&apiKey=$_apiKey";

  static topHeadLineApi({String? country, String? category}) =>
      "$_baseUrl/top-headlines?country=$country&category=$category&apiKey=$_apiKey";

  static const List<Map<String, String>> countries = [
    {"code": "US", "name": "United States", "flag": "🇺🇸"},
    {"code": "AE", "name": "United Arab Emirates", "flag": "🇦🇪"},
    {"code": "AR", "name": "Argentina", "flag": "🇦🇷"},
    {"code": "AT", "name": "Austria", "flag": "🇦🇹"},
    {"code": "AU", "name": "Australia", "flag": "🇦🇺"},
    {"code": "BE", "name": "Belgium", "flag": "🇧🇪"},
    {"code": "BG", "name": "Bulgaria", "flag": "🇧🇬"},
    {"code": "BR", "name": "Brazil", "flag": "🇧🇷"},
    {"code": "CA", "name": "Canada", "flag": "🇨🇦"},
    {"code": "CH", "name": "Switzerland", "flag": "🇨🇭"},
    {"code": "CN", "name": "China", "flag": "🇨🇳"},
    {"code": "CO", "name": "Colombia", "flag": "🇨🇴"},
    {"code": "CZ", "name": "Czech Republic", "flag": "🇨🇿"},
    {"code": "DE", "name": "Germany", "flag": "🇩🇪"},
    {"code": "EG", "name": "Egypt", "flag": "🇪🇬"},
    {"code": "FR", "name": "France", "flag": "🇫🇷"},
    {"code": "GB", "name": "United Kingdom", "flag": "🇬🇧"},
    {"code": "GR", "name": "Greece", "flag": "🇬🇷"},
    {"code": "HK", "name": "Hong Kong", "flag": "🇭🇰"},
    {"code": "HU", "name": "Hungary", "flag": "🇭🇺"},
    {"code": "ID", "name": "Indonesia", "flag": "🇮🇩"},
    {"code": "IE", "name": "Ireland", "flag": "🇮🇪"},
    {"code": "IL", "name": "Israel", "flag": "🇮🇱"},
    {"code": "IN", "name": "India", "flag": "🇮🇳"},
    {"code": "IT", "name": "Italy", "flag": "🇮🇹"},
    {"code": "JP", "name": "Japan", "flag": "🇯🇵"},
    {"code": "KR", "name": "South Korea", "flag": "🇰🇷"},
    {"code": "LT", "name": "Lithuania", "flag": "🇱🇹"},
    {"code": "LV", "name": "Latvia", "flag": "🇱🇻"},
    {"code": "MA", "name": "Morocco", "flag": "🇲🇦"},
    {"code": "MX", "name": "Mexico", "flag": "🇲🇽"},
    {"code": "MY", "name": "Malaysia", "flag": "🇲🇾"},
    {"code": "NG", "name": "Nigeria", "flag": "🇳🇬"},
    {"code": "NL", "name": "Netherlands", "flag": "🇳🇱"},
    {"code": "NZ", "name": "New Zealand", "flag": "🇳🇿"},
    {"code": "PH", "name": "Philippines", "flag": "🇵🇭"},
    {"code": "PL", "name": "Poland", "flag": "🇵🇱"},
    {"code": "PT", "name": "Portugal", "flag": "🇵🇹"},
    {"code": "RO", "name": "Romania", "flag": "🇷🇴"},
    {"code": "RS", "name": "Serbia", "flag": "🇷🇸"},
    {"code": "RU", "name": "Russia", "flag": "🇷🇺"},
    {"code": "SA", "name": "Saudi Arabia", "flag": "🇸🇦"},
    {"code": "SE", "name": "Sweden", "flag": "🇸🇪"},
    {"code": "SG", "name": "Singapore", "flag": "🇸🇬"},
    {"code": "SI", "name": "Slovenia", "flag": "🇸🇮"},
    {"code": "SK", "name": "Slovakia", "flag": "🇸🇰"},
    {"code": "TH", "name": "Thailand", "flag": "🇹🇭"},
    {"code": "TR", "name": "Turkey", "flag": "🇹🇷"},
    {"code": "TW", "name": "Taiwan", "flag": "🇹🇼"},
    {"code": "UA", "name": "Ukraine", "flag": "🇺🇦"},
    {"code": "VE", "name": "Venezuela", "flag": "🇻🇪"},
    {"code": "ZA", "name": "South Africa", "flag": "🇿🇦"},
  ];

  static const newsCategories = [
    "business", // Business News
    "entertainment", // Entertainment News
    "general", // General News
    "health", // Health News
    "science", // Science News
    "sports", // Sports News
    "technology", // Technology News
  ];
  static const newsCategoriesIcon = [
    CupertinoIcons.bitcoin, // Business
    CupertinoIcons.lightbulb, // Entertainment
    CupertinoIcons.globe, // General
    CupertinoIcons.heart, // Health
    CupertinoIcons.lab_flask, // Science
    CupertinoIcons.sportscourt, // Sports
    CupertinoIcons.keyboard, // Technology
  ];
}
