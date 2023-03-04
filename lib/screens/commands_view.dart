import 'dart:ffi';
import 'dart:math';
import 'package:appdelivery/Providers/commands.dart';
import 'package:appdelivery/models/command.dart';
import 'package:appdelivery/screens/details.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geocode/geocode.dart';

import 'package:provider/provider.dart';

import '../Providers/user_provider.dart';
import 'nav_Bar.dart';

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
  print(
      "${address.streetAddress}, ${address.city}, ${address.countryName}, ${address.postal}");
  return "${address.streetAddress}, ${address.city}, ${address.countryName}, ${address.postal}";
}

class _CommandsPageState extends State<CommandsPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("all commands"),
        centerTitle: true,
      ),
      drawer: NavBar(),
      body: Center(
        child: ListView.separated(
          itemCount: context.watch<Commands>().commands.length,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (
                    BuildContext context,
                  ) =>
                      buildPopupDialog(context, index),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                            context
                                .watch<Commands>()
                                .commands[index]
                                .store
                                .name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                                fontSize: 20)),
                        Text(
                          context.watch<Commands>().commands[index].date,
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                      ],
                    ),
                    Text(
                      context
                          .watch<Commands>()
                          .commands[index]
                          .store
                          .location
                          .city
                          .toUpperCase(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      context
                              .watch<Commands>()
                              .commands[index]
                              .store
                              .location
                              .haversine_distance(context
                              .watch<User>().location.latitude, context
                              .watch<User>().location.longitude)
                              .round()
                              .toString() +
                          "km",
                    ),
                    Text(
                      context.watch<Commands>().commands[index].price + "DT",
                    ),
                    const Icon(
                      Icons.run_circle,
                      color: Colors.green,
                      size: 36.0,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
