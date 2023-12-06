part of 'salon_search_cubit.dart';

// enum SalonSearchMinRating {
//   none(0),
//   one(1),
//   two(2),
//   three(3),
//   four(4),
//   five(5);

//   final double ratingValue;
//   const SalonSearchMinRating(this.ratingValue);

//   FirestoreFilter toFilter() =>
//       FirestoreFilter("rating_average", isGreaterThanOrEqualTo: ratingValue);

//   static SalonSearchMinRating? from(double value) => SalonSearchMinRating.values
//       .firstWhereOrNull((element) => element.ratingValue == value);
// }

enum SearchStatus {
  initial,
  loading,
  failed,
  succeed;
}

@freezed
class SalonSearchState with _$SalonSearchState {
  const factory SalonSearchState({
    @Default(SearchStatus.initial) SearchStatus status,
    @Default([]) List<Salon> salons,
    @Default("") String message,
    @Default({}) Set<String> filterServices,
    @Default(0.0) double filterMinRate,
    DayOfWeek? filterWorkDay,
    @TimeOfDayConverter() TimeOfDay? filterStartTime,
    @TimeOfDayConverter() TimeOfDay? filterEndTime,
  }) = _SalonSearchState;
}
