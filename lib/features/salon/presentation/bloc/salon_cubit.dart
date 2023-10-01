import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'salon_state.dart';

class SalonCubit extends Cubit<SalonState> {
  SalonCubit() : super(SalonInitial());
}
