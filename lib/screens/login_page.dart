import 'package:appdelivery/Providers/user_provider.dart';
import 'package:appdelivery/components/components.dart';
import 'package:appdelivery/screens/main_page_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

var loginController = TextEditingController();
var passWordController = TextEditingController();
var comp = Componnets();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Login"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Text(
                          "  Email",
                        ),
                      ),
                    ),
                    comp.textEmail(loginController, "Email", false)
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Column(children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Text(
                          "   Password",
                        ),
                      ),
                    ),
                    comp.textPassword(passWordController, "Password", true),
                  ]),
                ),
                Center(
                  child: Row(children: [
                    const Text("                     don't have account "),
                    InkWell(
                      child: const Text('Create One',
                          style: TextStyle(color: Colors.blue)),
                      // ignore: avoid_returning_null_for_void
                      onTap: () => Navigator.pushNamed(context, "/Register"),
                    ),
                  ]),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: const BorderSide(color: Colors.blue)))),
                  onPressed: () async {
                    if (await context
                        .read<User>()
                        .login(loginController.text, passWordController.text)) {
                      Navigator.pushNamed(context, '/MainPage');
                    } else {
                      showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                                title: const Text('Login failed'),
                                content: const Text(' Please check your credentials and try again'),
                                actions: <Widget>[
                        
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ));
                    }
                  },
                  child: const Text('connect'),
                ),
              ],
            ),
          ),
        ));
  }
}
