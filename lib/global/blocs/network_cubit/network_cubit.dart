import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/network/network_helper.dart';

// part 'internet_connection_event.dart';
part 'network_state.dart';

class NetworkCubit extends Cubit<NetworkState> {
  final NetworkHelper _networkInfo;
  NetworkCubit(this._networkInfo) : super(NetworkInitial()) {
    _checkConnection();
    _listenToConnectionChanges();
  }

  void _checkConnection() async {
    if (await _networkInfo.isConnected) {
      emit(NetworkConnected());
    } else {
      emit(NetworkDisconnected());
    }
  }

  void _listenToConnectionChanges() async {
    _networkInfo.onNetworkStateChanged(
      onConnected: () {
        emit(NetworkConnected());
      },
      onDisonnected: () {
        emit(NetworkDisconnected());
      },
    );
  }
}
