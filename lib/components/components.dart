import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';

Widget myText(String title, String text) {
  return Row(
    children: [
      Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
      Text(
        text,
        style: const TextStyle(fontSize: 15),
      ),
    ],
  );
}

class Componnets {
  myAvatar(double? radius, String path) {
    return CircleAvatar(
      backgroundImage: AssetImage(path),
      radius: radius,
    );
  }

  bool testmail(TextEditingController name) {
    print(name.text);
    if (!(GetUtils.isEmail(name.text))) {
      return false;
    }
    return true;
  }

  bool testpassword(TextEditingController name) {
    if (!(GetUtils.isLengthGreaterOrEqual(name.text, 5))) {
      return false;
    }
    return true;
  }

  bool testcin(TextEditingController name) {
    if (!(GetUtils.isNum(name.text))) {
      return false;
    }
    return true;
  }

  bool testusername(TextEditingController name) {
    if (!(GetUtils.isGreaterThan(name.text.length, 5))) {
      return false;
    } else {
      return true;
    }
  }

  bool testPhone(TextEditingController name) {
    if (!GetUtils.isPhoneNumber(name.text)) {
      return false;
    } else {
      return true;
    }
  }

  myBoxDecoration(double w, Color c1, double r, Color c2) {
    return BoxDecoration(
        border: Border.all(width: w, color: c1),
        borderRadius: BorderRadius.all(Radius.circular(r)),
        color: c2);
  }

  myContainer(double w, double h, double m, String text, TextStyle tStyle) {
    return Container(
      width: w,
      height: h,
      margin: EdgeInsets.all(m),
      child: Center(
          child: Text(
        text,
        style: tStyle,
      )),
    );
  }

  buttonStyle(Color color1, Color color2, TextStyle style) {
    return ElevatedButton.styleFrom(
        primary: color1,
        onPrimary: color2,
        textStyle: style,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: BorderSide(color: color2, width: 1.2)));
  }

  myButtonLink(String text, String page, ButtonStyle style) {
    return ElevatedButton(
        style: style,
        onPressed: () {
          Get.toNamed(page);
        },
        child: Text(text));
  }

  bool test(TextEditingController email, TextEditingController password,
      TextEditingController username, TextEditingController phone) {
    print(testmail(email));
    print(testusername(username));

    print(testpassword(password));
    print(testPhone(phone));

    return testmail(email) == true &&
        testusername(username) == true &&
        testpassword(password) == true &&
        testPhone(phone);
  }

  myButton(
      TextEditingController email,
      TextEditingController password,
      TextEditingController username,
      TextEditingController phone,
      String textbox,
      ButtonStyle style,
      BuildContext context) {
    return ElevatedButton(
        style: style,
        onPressed: () async {
          print(test(email, password, username, phone));
          if (test(email, password, username, phone)) {
            print("azeza");
            String url = "http://192.168.200.89:3000/driver/register";
            // String url = "http://192.168.31.54:3000/commands";
            Dio dio = new Dio();
            final data = {
              "email": email.text,
              "password": password.text,
              "fullName": username.text,
              "phoneNumber": phone.text
            };
            var response = await dio.post(url, data: data);
            print("aaaaaaaaaaaaaaaa");
            Navigator.pushNamed(context, '/');

            print(response);
          }
        },
        child: Text(textbox));
  }

  textIFullName(TextEditingController name, String labe, bool obscure,
      {Function? fun}) {
    return Padding(
        padding: EdgeInsets.all(15),
        child: TextFormField(
          obscureText: obscure,
          controller: name,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.0),
            ),
            fillColor: const Color(0xffEEF2F7),
            hintText: labe,
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xff535FF7), width: 2),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.pink[400]!, width: 2),
              borderRadius: BorderRadius.circular(10.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          validator: (value) {
            if (!GetUtils.isLengthGreaterThan(value, 5)) {
              // ignore: void_checks
              return "Min 5 chars";
            } else {
              return null;
            }
          },
        ));
  }

  textEmail(TextEditingController name, String labe, bool obscure,
      {Function? fun}) {
    return Padding(
        padding: EdgeInsets.all(15),
        child: TextFormField(
          controller: name,
          obscureText: obscure,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.0),
            ),
            fillColor: const Color(0xffEEF2F7),
            hintText: labe,
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xff535FF7), width: 2),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.pink[400]!, width: 2),
              borderRadius: BorderRadius.circular(10.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          validator: (value) {
            if (!GetUtils.isEmail(value!)) {
              // ignore: void_checks
              return "forma email bad";
            } else {
              return null;
            }
          },
        ));
  }

  textPhone(TextEditingController name, String labe, bool obscure,
      {Function? fun}) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: TextFormField(
        controller: name,
        obscureText: obscure,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
          fillColor: const Color(0xffEEF2F7),
          hintText: labe,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff535FF7), width: 2),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.pink[400]!, width: 2),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        validator: (value) {
          if (!GetUtils.isPhoneNumber(value!)) {
            return "not a phone number";
          } else {
            return null;
          }
        },
      ),
    );
  }

  textPassword(TextEditingController name, String labe, bool obscure,
      {Function? fun}) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: TextFormField(
        controller: name,
        obscureText: obscure,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
          fillColor: const Color(0xffEEF2F7),
          hintText: labe,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff535FF7), width: 2),
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.pink[400]!, width: 2),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        validator: (value) {
          if (!GetUtils.isLengthGreaterThan(value, 5)) {
            return "Min 5 chars";
          } else {
            return null;
          }
        },
      ),
    );
  }
}
