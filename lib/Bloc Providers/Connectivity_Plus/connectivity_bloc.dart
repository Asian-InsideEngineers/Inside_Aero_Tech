import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insideflyingconcept/Bloc%20Providers/Connectivity_Plus/connectivity_events.dart';
import 'package:insideflyingconcept/Bloc%20Providers/Connectivity_Plus/connectivity_state.dart';

class InternetConnectivityBloc extends Bloc<InternetEvents, InternetStates> {
  final Connectivity internetChecker = Connectivity();
  late StreamSubscription networkAnalyzer;

  InternetConnectivityBloc() : super(InternetSearchingState()) {
    on<InternetDisconnectedEvent>(
        (event, emit) => emit(InternetDisconnectedState()));

    on<InternetConnectedViaMobileEvent>(
        (event, emit) => emit(InternetConnectedviamobile()));

    on<InternetConnectedViaWifiEvent>(
        (event, emit) => emit(InternetConnectedviawifi()));

    networkAnalyzer = internetChecker.onConnectivityChanged.listen((event) {
      if (event.contains(ConnectivityResult.mobile)) {
        add(InternetConnectedViaMobileEvent());
      } else if (event.contains(ConnectivityResult.wifi)) {
        add(InternetConnectedViaWifiEvent());
      } else {
        add(InternetDisconnectedEvent());
      }
    });
  }

  @override
  Future<void> close() {
    networkAnalyzer.cancel();
    return super.close();
  }
}
