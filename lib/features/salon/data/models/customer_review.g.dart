// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CustomerReview _$$_CustomerReviewFromJson(Map<String, dynamic> json) =>
    _$_CustomerReview(
      id: json['id'] as String? ?? "",
      salon: json['salon'] ?? null,
      customer: json['customer'] ?? null,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      comment: json['comment'] as String? ?? "",
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$_CustomerReviewToJson(_$_CustomerReview instance) =>
    <String, dynamic>{
      'id': instance.id,
      'salon': instance.salon,
      'customer': instance.customer,
      'rating': instance.rating,
      'comment': instance.comment,
      'created_at': instance.createdAt?.toIso8601String(),
    };
