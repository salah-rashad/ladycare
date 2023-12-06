import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'customer_review.freezed.dart';
part 'customer_review.g.dart';

@freezed
class CustomerReview with _$CustomerReview {
  const factory CustomerReview({
    @Default("") String id,
    @Default(null) dynamic salon,
    @Default(null) dynamic customer,
    @Default(0.0) double rating,
    @Default("") String comment,
    DateTime? createdAt,
  }) = _CustomerReview;

  factory CustomerReview.fromJson(Map<String, dynamic> json) =>
      _$CustomerReviewFromJson(json);
}

extension CustomerReviewColRefExt on CollectionReference {
  CollectionReference<CustomerReview> withCustomerReviewConverter() {
    return withConverter(
      fromFirestore: (snapshot, options) {
        final data = snapshot.data()!;
        data['id'] = snapshot.id;
        return CustomerReview.fromJson(data);
      },
      toFirestore: (value, options) => value.toJson(),
    );
  }
}

extension CustomerReviewDocRefExt on DocumentReference {
  DocumentReference<CustomerReview> withCustomerReviewConverter() {
    return withConverter(
      fromFirestore: (snapshot, options) {
        final data = snapshot.data()!;
        data['id'] = snapshot.id;
        return CustomerReview.fromJson(data);
      },
      toFirestore: (value, options) => value.toJson(),
    );
  }
}
