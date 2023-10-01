// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomerReview _$$_CustomerReviewFromJson(Map<String, dynamic> json) =>
    _$_CustomerReview(
      id: json['id'] as String,
      salonId: json['salon_id'] as String,
      customerId: json['customer_id'] as String,
      rating: (json['rating'] as num).toDouble(),
      comment: json['comment'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$_CustomerReviewToJson(_$_CustomerReview instance) =>
    <String, dynamic>{
      'id': instance.id,
      'salon_id': instance.salonId,
      'customer_id': instance.customerId,
      'rating': instance.rating,
      'comment': instance.comment,
      'created_at': instance.createdAt.toIso8601String(),
    };
