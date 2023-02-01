import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../models/command.dart';

class Commands with ChangeNotifier {
  var commands = <Command>[];
  var commandsAccepted = <Command>[];
  late String tokenUser;
  late String idUser;
  String url="http://192.168.200.89:3000/commands" ;
  //  String url="http://192.168.31.54:3000/commands" ;

  void getAllCommands() async {
    var response = await Dio().get(url);
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
    print(commandsAccepted.length);
    final data = {"idDriver": idUser};
    var response = await Dio().patch(
        url+'/accept/${commands[index].idCommand}',
        data: data);
        print("dezdez");
    commandsAccepted.add(commands[index]);

    commands.remove(commands[index]);
    notifyListeners();
  }

  void update(String token, String userId) {
    tokenUser = token;
    idUser = userId;
  }

  void abandonedCommand(int index) async {
        commands.add(commandsAccepted[index]);

    var response = await Dio().patch(
        url+'/abandoned/${commandsAccepted[index].idCommand}');

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
