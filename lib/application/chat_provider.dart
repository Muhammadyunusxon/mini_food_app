import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:setup_provider/domain/model/chat_model.dart';
import 'package:web_socket_channel/io.dart';

class ChatProvider extends ChangeNotifier {
  IOWebSocketChannel? channel;
  String? name;
  List<ChatModel> list = [];

  connectSocket() async {
    channel = await IOWebSocketChannel.connect(
        "wss://s8733.nyc1.piesocket.com/v3/1?api_key=qI0c2JCkK1byM1GmLw6VYFG0Loaz3rHus3MAGFvy&notify_self=1");
    channel?.stream.listen((event) {
      list.insert(0,ChatModel.fromJson(jsonDecode(event)));
      notifyListeners();
    });
  }

  sendMessage({required String message}) {
    channel?.sink.add(jsonEncode(
        ChatModel(firstname: name ?? "", message: message).toJson()));
  }

  saveName(String name) {
    this.name = name;
  }

  close(){
    channel?.sink.close();
  }
}
