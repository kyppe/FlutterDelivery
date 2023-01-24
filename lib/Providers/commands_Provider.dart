import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../models/command.dart';

class Commands with ChangeNotifier 
{
  var commands = <Command>[];

  void getAllCommands  () async
  {
    
      var response = await Dio().get('http://192.168.31.56:3000/commands');

      for (var  item in response.data )
      {
        commands.add(Command.fromMap(item));
      }
  notifyListeners();
  }
 

}