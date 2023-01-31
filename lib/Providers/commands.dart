import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../models/command.dart';

class Commands with ChangeNotifier {
  var commands = <Command>[];
  var commandsAccepted = <Command>[];

  void getAllCommands() async {
    var response = await Dio().get('http://192.168.200.89:3000/commands');

    for (var item in response.data) {
      commands.add(Command.fromMap(item));
    }
    for (var command in commands) {
      print(command.store.name);
    }
    notifyListeners();
  }

  void acceptedCommand(int index) async {
    commandsAccepted.add(commands[index]);

    commands.remove(commands[index]);

    notifyListeners();
  }

  @override
  String toString() {
    String ch = "";
    for (var command in commands) {
      ch = ch +
          " description" +
          command.description +
          " status" +
          command.status;
    }
    return ch;
  }
}
