import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'loyalty_points_event.dart';
part 'loyalty_points_state.dart';

class LoyaltyPointsBloc extends Bloc<LoyaltyPointsEvent, LoyaltyPointsState> {
  LoyaltyPointsBloc() : super(LoyaltyPointsInitial()) {
    on<LoyaltyPointsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
