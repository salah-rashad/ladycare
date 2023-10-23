import 'dart:ui';
import 'package:path/path.dart' as p;

class Constants {
  Constants._();

  static const String appName = "Lady Care";
  static const Size designSize = Size(375, 812);
  static const String saudiArabiaPhoneCountryCode = "+966";
  static const String saudiArabiaCountryCode = "SA";
  static const Locale defaultLocale = Locale("ar", "SA");
  static const String defaultLocaleString = "ar_SA";
}

class FC {
  FC._();
  // TPL = Template
  // c = Collection
  // f = Field
  // p = path

  static const String cTPLServiceCategories = "TPL_service_categories";
  static const String cTPLServices = "TPL_services";
  static const String cTPLAmenities = "TPL_amenities";

  static const String cUsers = "users";
  static const String cHighlights = "highlights";
  static const String cSalons = "salons";
  static const String cCustomerReviews = "customer_reviews";
  static const String cServiceCategories = "service_categories";
  static const String cServices = "services";

  static const String fSalonAmenities = "amenities";
  static const String fSalonServices = "services";
  static const String fSalonShots = "shots";
  static const String fSalonName = "name";

  static String getSalonFolderPath(String salonId) =>
      p.join("images", "salons", salonId);
}
