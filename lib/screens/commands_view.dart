import 'dart:ffi';

import 'package:appdelivery/Providers/commands.dart';
import 'package:appdelivery/models/command.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geocode/geocode.dart';

import 'package:provider/provider.dart';

class CommandsPage extends StatefulWidget {
  const CommandsPage({Key? key}) : super(key: key);

  @override
  State<CommandsPage> createState() => _CommandsPageState();
}

Future<String> _getAddress(double? lat, double? lang) async {
 if (lat == null || lang == null) return "";
 GeoCode geoCode = GeoCode();
 Address address =
     await geoCode.reverseGeocoding(latitude: lat, longitude: lang);
     print("${address.streetAddress}, ${address.city}, ${address.countryName}, ${address.postal}");
 return "${address.streetAddress}, ${address.city}, ${address.countryName}, ${address.postal}";
}
class _CommandsPageState extends State<CommandsPage> {
  @override
  void initState() {
    super.initState();
// fetch the data on app start up
    Provider.of<Commands>(context, listen: false).getAllCommands();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("hola"),
      ),
      body: Center(
          child: ListView.separated(
              itemCount: context.watch<Commands>().commands.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    child: Row(children: [
                  Padding(
                    padding:
                        EdgeInsets.all(15), //apply padding to all four sides
                    child: Text(
                        context.watch<Commands>().commands[index].description),
                  ),
                  Text(
                    context.watch<Commands>().commands[index].status,
                  )
                ]));
              })),
      floatingActionButton: FloatingActionButton(
        onPressed:
         () async {
         await _getAddress(123.5,153);
        },
        tooltip: 'Increment',
        child: Icon(Icons.home_sharp),
      ),
    );
  }
}
