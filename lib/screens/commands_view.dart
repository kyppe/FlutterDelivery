import 'package:appdelivery/models/command.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CommmandsPage extends StatelessWidget {
  CommmandsPage({Key? key}) : super(key: key);
  String response = "";
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("hola"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'rafik cringe lv : pro',
            ),
            Text(
              response,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: const Icon(Icons.home_sharp),
      ),
    );
  }
}
