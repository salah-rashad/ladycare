import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/enums/day_of_week.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/usecase.dart';
import '../../data/models/salon.dart';
import '../repositories/salon_repository.dart';

class SalonSearchParams {
  final String? name;
  final String? location;
  final double? minRating;
  final Set<String>? services;
  final DayOfWeek? workDay;
  final TimeOfDay? workStartTime;
  final TimeOfDay? workEndTime;

  const SalonSearchParams({
    this.name,
    this.location,
    this.minRating,
    this.services,
    this.workDay,
    this.workStartTime,
    this.workEndTime,
  });
}

class SearchSalonsUsecase extends Usecase<List<Salon>, SalonSearchParams> {
  final SalonRepository repository;
  const SearchSalonsUsecase(this.repository);

  @override
  Future<Either<Failure, List<Salon>>> call([SalonSearchParams? params]) {
    return repository.search(params);
  }
}
