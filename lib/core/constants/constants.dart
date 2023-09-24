import 'dart:ui';

class Constants {
  Constants._();

  static const String appName = "Lady Care";
  static const Size designSize = Size(375, 812);
  static const String saudiArabiaPhoneCountryCode = "+966";
  static const String saudiArabiaCountryCode = "SA";
  static const Locale defaultLocale = Locale("ar", "SA");
  static const String defaultLocaleString = "ar_SA";
}

class FirebaseConstants {
  FirebaseConstants._();

  static const String usersCollection = "users";
  static const String highlightsCollection = "highlights";
  static const String serviceCategoriesCollection = "service_categories";
  
}
