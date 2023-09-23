import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../../core/utils/extensions.dart';
import '../../../../domain/entities/user_data.dart';
import '../../../../domain/usecases/get_user_profile_usecase.dart';
import '../../../../domain/usecases/logout_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LogoutUsecase _logoutUsecase;
  final GetUserProfileUsecase _getUserProfileUsecase;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  UserData? userData;

  AuthCubit(
    this._logoutUsecase,
    this._getUserProfileUsecase,
  ) : super(AuthInitial()) {
    _checkAuthenticationStatus();
  }

  bool get isAuthenticated => _firebaseAuth.currentUser != null;

  void _checkAuthenticationStatus() async {
    _firebaseAuth.authStateChanges().listen((user) async {
      if (user != null) {
        final result = await _getUserProfileUsecase();
        final state = result.fold(
          (failure) => AuthError(message: failure.message),
          (userData) => Authenticated(userData: userData),
        );
        emit(state);
      } else {
        emit(Unauthenticated());
      }
    });
  }

  Future<void> logout() async {
    final result = await _logoutUsecase();
    final state = result.fold(
      (failure) => AuthError(message: failure.message),
      (success) => Unauthenticated(),
    );
    emit(state);
  }
}
