import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:google_fonts/google_fonts.dart';

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
  var myStyle =
      GoogleFonts.poppins(color: Colors.grey[700], fontWeight: FontWeight.bold);
  var myStyle2 = GoogleFonts.fruktur(
      color: Colors.red[700], fontWeight: FontWeight.normal);
  var myStyle3 =
      GoogleFonts.fruktur(color: Colors.black, fontWeight: FontWeight.bold);

  myAvatar(double? radius, String path) {
    return CircleAvatar(
      backgroundImage: AssetImage(path),
      radius: radius,
    );
  }

  void testmail(TextEditingController name) {

    if (!(GetUtils.isEmail(name.text))) {

      Get.snackbar('incorrect'.tr, 'Email format bad'.tr,
          backgroundColor: Colors.red[900], snackPosition: SnackPosition.TOP);

    }
  }

  void testpassword(TextEditingController name) {
    if (!(GetUtils.isLengthGreaterOrEqual(name.text, 8))) {
      Get.snackbar('incorrect'.tr, 'password length should be 8 or more'.tr,
          backgroundColor: Colors.red[900], snackPosition: SnackPosition.TOP);
    } else if ((GetUtils.isAlphabetOnly(name.text))) {
      Get.snackbar('incorrect'.tr, 'need to at least one number'.tr,
          backgroundColor: Colors.red[900], snackPosition: SnackPosition.TOP);
    } else if (!(GetUtils.hasCapitalletter(name.text))) {
      Get.snackbar('incorrect'.tr, 'need at least one Capital letter'.tr,
          backgroundColor: Colors.red[900], snackPosition: SnackPosition.TOP);
    }
  }

  void testcin(TextEditingController name) {
    if (!(GetUtils.isNum(name.text))) {
      Get.snackbar('incorrect'.tr, 'should be only number'.tr,
          backgroundColor: Colors.red[900], snackPosition: SnackPosition.TOP);
    }
  }

  void testusername(TextEditingController name) {
    if (!(GetUtils.isUsername(name.text))) {
      Get.snackbar('incorrect'.tr, 'username format bad'.tr,
          backgroundColor: Colors.red[900], snackPosition: SnackPosition.TOP);
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

  void test(TextEditingController cin, TextEditingController email,
      TextEditingController password, TextEditingController username) {
    testmail(email);
    testusername(username);
    testcin(cin);
    testpassword(password);
  }

  myButton(
      TextEditingController cin,
      TextEditingController email,
      TextEditingController password,
      TextEditingController username,
      String textbox,
      ButtonStyle style) {
    return ElevatedButton(
        style: style,
        onPressed: () {
          test(cin, email, password, username);
        },
        child: Text(textbox));
  }

  myImage(String path) {
    return Image(image: AssetImage(path));
  }

  textInput(TextEditingController name, String labe, bool obscure,
      {Function? fun}) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: TextField(
        controller: name,
        obscureText: obscure,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: labe,
          hintText: labe,
        ),
      ),
    );
  }
}
