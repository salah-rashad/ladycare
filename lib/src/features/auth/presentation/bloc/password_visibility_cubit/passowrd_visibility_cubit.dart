import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'passowrd_visibility_state.dart';

class PassowrdVisibilityCubit extends Cubit<PassowrdVisibilityState> {
  PassowrdVisibilityCubit() : super(PasswordInvisible());

  void toggle() {
    switch (state) {
      case PasswordVisible():
        emit(PasswordInvisible());
      case PasswordInvisible():
        emit(PasswordVisible());
    }
  }
}
