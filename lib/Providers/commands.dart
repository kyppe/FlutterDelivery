import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../models/command.dart';

class Commands with ChangeNotifier {
  var commands = <Command>[];
  var commandsAccepted = <Command>[];
  late String tokenUser;
  late String idUser;
  //String url="http://192.168.200.89:3000/commands" ;
  String url = "http://192.168.31.54:3000/commands";

  void getAllCommands() async {
    Dio dio = new Dio();
   commands = <Command>[];
   commandsAccepted = <Command>[];
    dio.options.headers["authorization"] = tokenUser;

    var response = await dio.get(url);
    print(idUser);
    for (var item in response.data) {
      if (item["idDriver"] == idUser) {
        commandsAccepted.add(Command.fromMap(item));
      } else if (item["status"] == "pending") {
        commands.add(Command.fromMap(item));
      }
    }

    notifyListeners();
  }

  void acceptedCommand(int index) async {
    Dio dio = new Dio();

    dio.options.headers["authorization"] = tokenUser;

    print(commandsAccepted.length);
    final data = {"idDriver": idUser};
    var response = await dio.patch(url + '/accept/${commands[index].idCommand}',
        data: data);
    commandsAccepted.add(commands[index]);

    commands.remove(commands[index]);
    notifyListeners();
  }

  void update(String token, String userId) {
    tokenUser = token;
    idUser = userId;
  }

  void abandonedCommand(int index) async {
    Dio dio = new Dio();

    dio.options.headers["authorization"] = tokenUser;


    var response = await dio
        .patch(url + '/abandoned/${commandsAccepted[index].idCommand}');
    commands.add(commandsAccepted[index]);

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
