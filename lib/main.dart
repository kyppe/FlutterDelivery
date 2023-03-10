import 'package:appdelivery/Providers/commands.dart';
import 'package:appdelivery/Providers/user_provider.dart';
import 'package:appdelivery/screens/commands_view.dart';
import 'package:appdelivery/screens/login_page.dart';
import 'package:appdelivery/screens/main_page_state.dart';
import 'package:appdelivery/screens/register_page.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:provider/provider.dart';

import 'components/components.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
            value: User(idUser: null, phone: null, userName: null)),
        ChangeNotifierProxyProvider<User, Commands>(
            create: (ctx) => Commands(),
            update: (_, user, data) => data!..update(user.token, user.idUser))
      ],
      child: Directionality(
        child: const MyApp(),
        textDirection: TextDirection.rtl, // setting rtl
      ),
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
        '/MainPage': ((context) => MainPageState()),
        '/Register': ((context) => RegisterPage()),
      },
    );
  }
}
