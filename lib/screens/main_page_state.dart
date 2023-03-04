import 'package:appdelivery/Providers/commands.dart';
import 'package:appdelivery/Providers/user_provider.dart';
import 'package:appdelivery/screens/command_accepted.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:location/location.dart';

import 'commands_view.dart';

class MainPageState extends StatefulWidget {
  MainPageState({Key? key}) : super(key: key);

  @override
  State<MainPageState> createState() => _MainPageStateState();
}

Location location = Location();
late bool _serviceEnabled;
late PermissionStatus _permissionGranted;
LocationData? _locationData;

Future<void> _getLocation() async {
  _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {
      return;
    }
  }

  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      return;
    }
  }
  _locationData = await location.getLocation();
  print(_locationData);
}

int currentIndex = 0;
final screens = [CommandsPage(), AcceptedCommandPage()];

class _MainPageStateState extends State<MainPageState> {
  void initState() {
    super.initState();
    _getLocation().whenComplete(() {
        if (_locationData != null) {
      Provider.of<User>(context, listen: false).SetLocation(_locationData!);
      print(context.read<User>().location);
         Provider.of<Commands>(context, listen: false).getAllCommands();
    }
      setState(() {});
    });
 
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.delivery_dining_sharp),
              label: "All commands",
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_task_sharp),
              label: "Accepted Commands",
              backgroundColor: Colors.orange)
        ],
      ),
    );
  }
}
