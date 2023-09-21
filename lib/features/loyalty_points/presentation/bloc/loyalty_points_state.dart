part of 'loyalty_points_bloc.dart';

abstract class LoyaltyPointsState extends Equatable {
  const LoyaltyPointsState();  

  @override
  List<Object> get props => [];
}
class LoyaltyPointsInitial extends LoyaltyPointsState {}
