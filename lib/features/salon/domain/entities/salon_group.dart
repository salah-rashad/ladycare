import '../../data/models/salon.dart';
import '../../data/models/salon_amenity.dart';
import '../../data/models/services_category.dart';

class SalonGroup {
  final Salon salon;
  final List<SalonAmenity> amenities;
  final List<ServicesCategory> categories;
  
  SalonGroup({
    required this.salon,
    required this.amenities,
    required this.categories,
  });
}
