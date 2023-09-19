import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/entities/user_data.dart';
import '../../../domain/usecases/get_user_profile_usecase.dart';
import '../../../domain/usecases/logout_usecase.dart';


// part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Cubit<AuthState> {
  final LogoutUsecase _logoutUsecase;
  final GetUserProfileUsecase _getUserProfileUsecase;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  AuthBloc(
    this._logoutUsecase,
    this._getUserProfileUsecase,
  ) : super(AuthInitial()) {
    _checkAuthenticationStatus();

    // on<AuthEvent>((event, emit) async {
    //   switch (event) {
    //     case Authenticated():
    //       print("Initializing");
    //       _checkAuthenticationStatus(emit);
    //       break;
    //     case Un():
    //       await _logout(emit);
    //       break;
    //   }
    // });
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

  // Future<void> _login(Emitter<AuthState> emit, LoginEvent event) async {
  //   final isFormValid = formKey.currentState!.validate();
  //   if (isFormValid) {
  //     emit(AuthLoading());
  //     final result = await _loginUsecase((
  //       email: event.email,
  //       password: event.password,
  //     ));
  //     final state = result.fold(
  //       (failure) => AuthError(message: failure.message),
  //       (userData) => Authenticated(userData: userData),
  //     );
  //     emit(state);
  //   }
  // }

  // Future<void> _signUp(Emitter<AuthState> emit, SignUpEvent event) async {
  //   final isFormValid = formKey.currentState!.validate();
  //   if (isFormValid) {
  //     emit(AuthLoading());
  //     final result = await _signupUsecase((
  //       user: event.userData,
  //       password: event.password,
  //     ));
  //     final state = result.fold(
  //       (failure) => AuthError(message: failure.message),
  //       (userData) => Authenticated(userData: userData),
  //     );
  //     emit(state);
  //   }
  // }

  Future<void> logout() async {
    await _logoutUsecase();
    emit(Unauthenticated());
  }
}
