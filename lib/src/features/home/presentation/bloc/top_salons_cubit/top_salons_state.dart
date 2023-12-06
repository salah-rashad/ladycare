part of 'top_salons_cubit.dart';

sealed class TopSalonsState extends Equatable {
  const TopSalonsState();

  @override
  List<Object> get props => [];
}

final class TopSalonsInitial extends TopSalonsState {}

final class TopSalonsLoading extends TopSalonsState {}

final class TopSalonsSucceed extends TopSalonsState {
  final List<Salon> salons;
  const TopSalonsSucceed({required this.salons});

  @override
  List<Object> get props => [salons];
}

final class TopSalonsFailed extends TopSalonsState {
  final String message;
  const TopSalonsFailed({required this.message});

  @override
  List<Object> get props => [message];
}
