import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

import 'salon_amenity.dart';
import 'salon_service.dart';
import 'work_days.dart';

part 'salon.g.dart';

@JsonSerializable()
class Salon extends Equatable {
  final String id;
  final String name;
  final String description;
  final String profileImageUrl;
  final List<String> locations;
  final List<String> shots;
  @JsonKey(fromJson: _servicesFromJson)
  final List<SalonService> services;
  @JsonKey(fromJson: _amenitiesFromJson)
  final List<SalonAmenity> amenities;
  final WorkDays workDays;
  final double? ratingAverage;

  const Salon({
    required this.id,
    this.name = "",
    this.description = "",
    this.profileImageUrl = "",
    this.locations = const [],
    this.shots = const [],
    this.services = const [],
    this.amenities = const [],
    this.workDays = const WorkDays(),
    this.ratingAverage,
  });

  static List<SalonService> _servicesFromJson(List<dynamic> docs) {
    return [];
  }

  static List<SalonAmenity> _amenitiesFromJson(List<dynamic> docs) {
    return [];
  }

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        profileImageUrl,
        locations,
        shots,
        services,
        amenities,
        workDays,
        ratingAverage
      ];

  Map<String, dynamic> toJson() => _$SalonToJson(this);

  factory Salon.fromJson(Map<String, dynamic> json) => _$SalonFromJson(json);

  Salon copyWith({
    String? id,
    String? name,
    String? description,
    String? profileImageUrl,
    List<String>? locations,
    List<String>? shots,
    List<SalonService>? services,
    List<SalonAmenity>? amenities,
    WorkDays? workDays,
    ValueGetter<double?>? ratingAverage,
  }) {
    return Salon(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      locations: locations ?? this.locations,
      shots: shots ?? this.shots,
      services: services ?? this.services,
      amenities: amenities ?? this.amenities,
      workDays: workDays ?? this.workDays,
      ratingAverage:
          ratingAverage != null ? ratingAverage() : this.ratingAverage,
    );
  }
}

extension SalonColRefExt on CollectionReference {
  CollectionReference<Salon> withSalonConverter() {
    return withConverter(
      fromFirestore: (snapshot, options) {
        final data = snapshot.data()!;
        data['id'] = snapshot.id;
        return Salon.fromJson(data);
      },
      toFirestore: (value, options) => value.toJson(),
    );
  }
}

extension SalonDocRefExt on DocumentReference {
  DocumentReference<Salon> withSalonConverter() {
    return withConverter(
      fromFirestore: (snapshot, options) {
        final data = snapshot.data()!;
        data['id'] = snapshot.id;
        return Salon.fromJson(data);
      },
      toFirestore: (value, options) => value.toJson(),
    );
  }
}
