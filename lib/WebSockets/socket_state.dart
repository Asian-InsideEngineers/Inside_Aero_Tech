// drone_state.dart

abstract class SocketState {}

class InitialSocketState extends SocketState {}

class ConnectingSocketState extends SocketState {}

class ConnectedSocketState extends SocketState {
  final String ConnectDrone;
  ConnectedSocketState(this.ConnectDrone);
}

class SocketExitState extends SocketState {}

class SocketErrorState extends SocketState {
  final String errorMessage;
  SocketErrorState(this.errorMessage);
}
