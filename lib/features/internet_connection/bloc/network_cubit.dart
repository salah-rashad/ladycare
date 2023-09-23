import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

import '../../../core/network/network_helper.dart';

// part 'internet_connection_event.dart';
part 'network_state.dart';

class NetworkCubit extends Cubit<NetworkState> {
  final NetworkHelper _networkInfo;
  NetworkCubit(this._networkInfo) : super(NetworkInitial()) {
    _listenToConnectionChanges();
  }

  void _listenToConnectionChanges() {
    _networkInfo.onNetworkStatusChange((status) {
      switch (status) {
        case InternetStatus.connected:
          emit(NetworkConnected());
          break;
        case InternetStatus.disconnected:
          emit(NetworkDisconnected());
          break;
      }
    });
  }
}
