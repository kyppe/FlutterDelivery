import 'package:appdelivery/Providers/commands.dart';
import 'package:appdelivery/screens/command_accepted.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'commands_view.dart';

class MainPageState extends StatefulWidget {
  MainPageState({Key? key}) : super(key: key);

  @override
  State<MainPageState> createState() => _MainPageStateState();
}

int currentIndex = 0;
final screens = [CommandsPage(), AcceptedCommandPage()];

class _MainPageStateState extends State<MainPageState> {
  void initState() {
    super.initState();
// fetch the data on app start up
    Provider.of<Commands>(context, listen: false).getAllCommands();
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
              icon: Icon(Icons.social_distance),
              label: "home",
              backgroundColor: Colors.blue),
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit),
              label: "lol",
              backgroundColor: Colors.orange)
        ],
      ),
    );
  }
}
