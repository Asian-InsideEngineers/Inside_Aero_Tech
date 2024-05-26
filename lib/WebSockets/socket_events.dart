// drone_event.dart

abstract class SocketEvents {}

class SendMessageEvent extends SocketEvents {
  final String message;
  SendMessageEvent(this.message);
}
