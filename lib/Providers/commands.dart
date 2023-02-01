import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../models/command.dart';

class Commands with ChangeNotifier {
  var commands = <Command>[];
  var commandsAccepted = <Command>[];
  late String tokenUser;
  late String idUser;

  void getAllCommands() async {
    // var response = await Dio().get('http://192.168.200.89:3000/commands');
    var response = await Dio().get('http://192.168.31.54:3000/commands');
    print(idUser);
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
    print(commandsAccepted.length);
    final data = {"idDriver": idUser};
    var response = await Dio().patch(
        'http://192.168.31.54:3000/commands/accept/${commands[index].idCommand}',
        data: data);
    commands.remove(commands[index]);
    notifyListeners();
  }

  void update(String token, String userId) {
    tokenUser = token;
    idUser = userId;
  }
  void abandonedCommand(int index) async
  {
        commands.add(commandsAccepted[index]);
    var response = await Dio().patch(
        'http://192.168.31.54:3000/commands/abandoned/${commandsAccepted[index].idCommand}');
      commandsAccepted.remove(commandsAccepted[index]);
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
