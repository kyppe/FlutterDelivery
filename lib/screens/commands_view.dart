import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CommmandsPage extends StatelessWidget {
  CommmandsPage({Key? key}) : super(key: key);
  String response = "";
  void _incrementCounter() async {
    try {
      print("aaa");

      var response = await Dio().get('http://192.168.200.89:3000/commands');
      print(response);
    } catch (e) {
      print(e);
    }
  }

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
              'rafik cringe lv : 999999',
            ),
            Text(
              response,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.home_sharp),
      ),
    );
  }
}
