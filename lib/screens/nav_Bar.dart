// ignore_for_file: file_names

import 'package:appdelivery/Providers/commands.dart';
import 'package:appdelivery/Providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/components.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(context.watch<User>().userName),
            accountEmail: Text(context.watch<User>().email),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
            ),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Phone Number : ' + context.watch<User>().phone),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('total of Commands accepted   : ' +
                context.watch<Commands>().commandsAccepted.length.toString()),
            onTap: () => null,
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('total of Commands pendding   : ' +
                context.watch<Commands>().commands.length.toString()),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            title: Text('Exit'),
            leading: Icon(Icons.exit_to_app),
            onTap: () => Navigator.pushNamed(context, "/"),
          ),
        ],
      ),
    );
  }
}
