enum MessageType { text, file, image }

class ChatMessageModel {
  final MessageType msgType;
  final String content;
  ChatMessageModel({required this.msgType, required this.content});
}
