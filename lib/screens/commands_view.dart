import 'package:appdelivery/Providers/commands_Provider.dart';
import 'package:appdelivery/models/command.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CommmandsPage extends StatelessWidget {
  CommmandsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    if (context.watch<Commands>().commands.isNotEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("hola"),
        ),
        body: Center(
            child: ListView.builder(
                itemBuilder: (context, index) => Text(
                    context.watch<Commands>().commands[index].description))),
        floatingActionButton: FloatingActionButton(
          onPressed: context.read<Commands>().getAllCommands,
          tooltip: 'Increment',
          child: Icon(Icons.home_sharp),
        ),
      );
    }
    else 
    {
      return Scaffold(
        appBar: AppBar(
          title: const Text("hola"),
        ),
        body: Center( child :Text("aaa")),
        floatingActionButton: FloatingActionButton(
          onPressed: context.read<Commands>().getAllCommands,
          tooltip: 'Increment',
          child: Icon(Icons.home_sharp),
        ),);
    }
  }
}
