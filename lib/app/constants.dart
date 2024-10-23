abstract class AppConstants {
  static const _baseUrl = "https://newsapi.org/v2";
  static const _apiKey = "2fbf9799a7fb47c88f266c543fb36a78";

  static searchApi(String word) =>
      "$_baseUrl/everything?q=$word&from=${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day - 1}&sortBy=publishedAt&apiKey=$_apiKey";

  static topHeadLineApi({String? country, String? category}) =>
      "$_baseUrl/top-headlines?country=$country&category=$category&apiKey=$_apiKey";

  static const countryCodes = [
    "AE", // United Arab Emirates
    "AR", // Argentina
    "AT", // Austria
    "AU", // Australia
    "BE", // Belgium
    "BG", // Bulgaria
    "BR", // Brazil
    "CA", // Canada
    "CH", // Switzerland
    "CN", // China
    "CO", // Colombia
    "CZ", // Czech Republic
    "DE", // Germany
    "EG", // Egypt
    "FR", // France
    "GB", // United Kingdom
    "GR", // Greece
    "HK", // Hong Kong
    "HU", // Hungary
    "ID", // Indonesia
    "IE", // Ireland
    "IL", // Israel
    "IN", // India
    "IT", // Italy
    "JP", // Japan
    "KR", // South Korea
    "LT", // Lithuania
    "LV", // Latvia
    "MA", // Morocco
    "MX", // Mexico
    "MY", // Malaysia
    "NG", // Nigeria
    "NL", // Netherlands
    "NZ", // New Zealand
    "PH", // Philippines
    "PL", // Poland
    "PT", // Portugal
    "RO", // Romania
    "RS", // Serbia
    "RU", // Russia
    "SA", // Saudi Arabia
    "SE", // Sweden
    "SG", // Singapore
    "SI", // Slovenia
    "SK", // Slovakia
    "TH", // Thailand
    "TR", // Turkey
    "TW", // Taiwan
    "UA", // Ukraine
    "US", // United States
    "VE", // Venezuela
    "ZA", // South Africa
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
}
