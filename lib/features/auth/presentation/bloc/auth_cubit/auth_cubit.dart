import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/network/network_helper.dart';
import '../../../../../core/routes/go_router.dart';
import '../../../../../core/routes/routes.dart';
import '../../../domain/entities/user_data.dart';
import '../../../domain/usecases/get_user_profile_usecase.dart';
import '../../../domain/usecases/logout_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _firebaseAuth;
  final NetworkHelper _networkHelper;
  final GetUserProfileUsecase _getUserProfileUsecase;
  final LogoutUsecase _logoutUsecase;

  AuthCubit(
    this._firebaseAuth,
    this._networkHelper,
    this._getUserProfileUsecase,
    this._logoutUsecase,
  ) : super(AuthInitial()) {
    _observeAuthState();
    _updateUserDataOnIneternetConnected();
  }

  bool get isAuthenticated => _firebaseAuth.currentUser != null;

  Future<void> _fetchUserProfile() async {
    if (isAuthenticated) {
      final result = await _getUserProfileUsecase();

      final state = result.fold(
        (failure) => AuthError(message: failure.message),
        (userData) => Authenticated(userData: userData),
      );
      emit(state);
    }
  }

  void _observeAuthState() async {
    _firebaseAuth.authStateChanges().listen((user) async {
      if (user != null) {
        _fetchUserProfile();
      } else {
        emit(Unauthenticated());
      }
    });
  }

  void _updateUserDataOnIneternetConnected() {
    _networkHelper.onNetworkStateChanged(
      onConnected: () {
        _fetchUserProfile();
      },
      onDisonnected: () {},
    );
  }

  Future<void> logout() async {
    final result = await _logoutUsecase();
    final state = result.fold(
      (failure) => AuthError(message: failure.message),
      (success) => Unauthenticated(),
    );
    emit(state);
  }

  @override
  void onChange(Change<AuthState> change) {
    super.onChange(change);

    if (change.nextState is Unauthenticated) {
      final currentContext = AppRouter.rootNavigatorKey.currentContext!;
      currentContext.replaceNamed(Routes.LOGIN.name);
    }
  }
}
