import 'dart:ffi';
import 'dart:math';

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
  double haversine_distance(double lat1,double lng1,double lat2,double lng2) {
      var R = 3958.8; // Radius of the Earth in miles
      var rlat1 = lat1 * (pi/180); // Convert degrees to radians
      var rlat2 = lat2 * (pi/180); // Convert degrees to radians
      var difflat = rlat2-rlat1; // Radian difference (latitudes)
      var difflon = (lng2-lng1) * (pi/180); // Radian difference (longitudes)

      var d = 2 * R * asin(sqrt(sin(difflat/2)*sin(difflat/2)+cos(rlat1)*cos(rlat2)*sin(difflon/2)*sin(difflon/2)));
      print((d*1.60934).toString()+" km");
      return d*1.60934;
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
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(children: [
                    Text(context.watch<Commands>().commands[index].store.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 20)),
                    Text(context.watch<Commands>().commands[index].date,
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 10)),
                  ]),
                  Text(
                      context
                          .watch<Commands>()
                          .commands[index].store
                          .location
                          .city
                          .toUpperCase(),
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(
                    haversine_distance(36.757154, 10.013860,context.watch<Commands>().commands[index].store.location.coordinates[0],context.watch<Commands>().commands[index].store.location.coordinates[1]).round().toString()+"km",
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
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await haversine_distance(36.757154, 10.013860,36.809107, 10.175742);
        },
        tooltip: 'Increment',
        child: Icon(Icons.home_sharp),
      ),
    );
  }
}
