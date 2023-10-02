import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'salon_search_state.dart';

class SalonSearchCubit extends Cubit<SalonSearchState> {
  SalonSearchCubit() : super(SalonSearchInitial());
}
