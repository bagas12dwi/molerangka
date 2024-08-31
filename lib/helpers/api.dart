class Api {
  Api._();

  // static const String baseUrl = "http://media-pembelajaran-web.test/api";
  // static const String baseUrl = "http://192.168.18.8/media-pembelajaran-web/public/api";
  // static const String imgUrl = "http://192.168.18.8/media-pembelajaran-web/public/storage";
  // static const String baseUrl = "http://192.168.1.16/media-pembelajaran-web/public/api";
  // static const String imgUrl = "http://192.168.1.16/media-pembelajaran-web/public/storage";
  static const String baseUrl = "https://media-pembelajaran.adaicbt.my.id/public/api";
  static const String imgUrl = "https://media-pembelajaran.adaicbt.my.id/public/storage";
  // static const String baseUrl = "https://adaicbt.my.id/api";
  static const Duration receiveTimeout = Duration(seconds: 15000);
  static const Duration connectionTimeout = Duration(seconds: 15000);
}