import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/components.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: RegisterPageView(),
    );
  }
}

class RegisterPageView extends StatefulWidget {
  const RegisterPageView({Key? key}) : super(key: key);

  @override
  _RegisterPageViewState createState() => _RegisterPageViewState();
}

class _RegisterPageViewState extends State<RegisterPageView> {
 
  var comp = Componnets();

  @override
  Widget build(BuildContext context) {
       TextEditingController emailcontroller = TextEditingController();
        TextEditingController passcontroller = TextEditingController();
  TextEditingController usernamecontroller = TextEditingController();
    TextEditingController cincontroller = TextEditingController();

      return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children:  [
            comp.myContainer(
              
              200,
              80,
              4,
              "Registration",
              const TextStyle(fontFamily :'arial',fontWeight: FontWeight.bold,fontSize: 20 )),
          
            comp.textInput(emailcontroller,"Email",false ) ,   
            comp.textInput(usernamecontroller,"Username",false ) ,   
            comp.textInput(passcontroller,"Password",true ) ,   
            comp.myButton(cincontroller,emailcontroller,passcontroller,usernamecontroller,"create", comp.buttonStyle(Colors.blue,Colors.white,const TextStyle(fontFamily:'arial',fontSize: 20))),
              RichText(
                text : const TextSpan(
               text : "do you have an account  ?  ",
                    style: TextStyle( color: Colors.black, fontSize: 10, fontFamily: 'arial',),
                    children: [
                      TextSpan(text: "login now",
                      style: TextStyle( color: Colors.blue,fontWeight: FontWeight.bold ,fontSize: 10, fontFamily: 'arial',),
                      )
                    ] 
                ),
                    ),
        
      ],
      ));
  }
}