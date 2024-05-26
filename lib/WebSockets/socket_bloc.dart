import 'package:bloc/bloc.dart';
import 'package:insideflyingconcept/WebSockets/socket_state.dart';
import 'package:insideflyingconcept/main.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocket extends Cubit<SocketState> {
  late final WebSocketChannel _channel;

  WebSocket() : super(InitialSocketState()) {
    _initWebSocket();
  }

  void _initWebSocket() {
    // const wsUrl = 'ws://192.168.31.107:8080';
    const wsUrl = 'wss://192.168.1.38:8080';
    try {
      _channel = IOWebSocketChannel.connect(Uri.parse(wsUrl));
      _channel.stream.listen(
        (ConnectDrone) {
          log.d('Received message: $ConnectDrone');
          emit(ConnectedSocketState(ConnectDrone.toString()));
        },
        onError: (error) {
          log.e('WebSocket error: $error');
          emit(SocketErrorState('WebSocket error: $error'));
        },
        onDone: () {
          log.d('WebSocket connection closed');
          emit(SocketExitState());
        },
      );
      emit(ConnectedSocketState('ConectDrone')); // Emit connected state here
    } catch (e) {
      log.e('Failed to connect to WebSocket: $e');
      emit(SocketErrorState('Failed to connect to WebSocket: $e'));
    }
  }

  void sendWebSocketMessage(String ConnectDrone) {
    try {
      emit(ConnectingSocketState());
      _channel.sink.add(ConnectDrone);
    } catch (e) {
      log.e('Failed to send message: $e');
      emit(SocketErrorState('Failed to send message: $e'));
    }
  }

  @override
  Future<void> close() {
    _channel.sink.close();
    return super.close();
  }
}
