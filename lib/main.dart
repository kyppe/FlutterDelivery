import 'package:appdelivery/Providers/commands.dart';
import 'package:appdelivery/Providers/user_provider.dart';
import 'package:appdelivery/screens/commands_view.dart';
import 'package:appdelivery/screens/login_page.dart';
import 'package:appdelivery/screens/main_page_state.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: User(idUser: null, phone: null, userName: null)),
      ChangeNotifierProxyProvider<User,Commands>(
        create: (ctx) => Commands(),
        update:(_,user,data)=> data!..update(user.token,user.idUser))
    
    ] ,
          child: const MyApp()

      ),
      
  );

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        '/': (context) => LoginPage(),
        '/MainPage':((context) => MainPageState())
      },
    );
  }
}
