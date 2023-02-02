import 'package:appdelivery/Providers/user_provider.dart';
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
class _LoginPageState extends State<LoginPage> {
 
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter TextField Example'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
             Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                controller: loginController,
                decoration:const  InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                  hintText: 'Enter Your Name',
                ),
              ),
            ),
             Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
                controller: passWordController,
                obscureText: true,
                
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter Password',
                ),
              ),
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
                print(passWordController.text);
                print(loginController.text);
                if( await context.read<User>().login(loginController.text,passWordController.text))
                {
                Navigator.pushNamed(context, '/MainPage');  

                }
                else 
                {
                  print("error");
                }
              },
              child: const Text('connect'),
            ),
          ],
        ),
      ),
    );
  }
}
