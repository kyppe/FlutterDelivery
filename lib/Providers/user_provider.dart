import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../models/location.dart';

class User with ChangeNotifier {
  late String userName;
  String idUser = "123456789123456789123456";
  String token = " ";
  late String phone;
  late Location location;
  User({required phone, required userName, required idUser});

  Future<bool> login(String email, String password) async {
//String url="http://192.168.200.89:3000/driver/login" ;
    try {
      String url = "http://192.168.31.54:3000/driver/login";
      final data = {"email": email, "password": password};

      var response = await Dio().post(url, data: data);
      if (response == Null) {
        return false;
      } else {
        User.fromMap(response.data);

        userName = response.data["fullName"];
        phone = response.data["phoneNumber"];
        idUser = response.data["_id"];

        print(idUser);

        notifyListeners();

        return true;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  factory User.fromMap(Map<String, dynamic> server) {
    return User(
      userName: server["fullName"],
      phone: server["phoneNumber"],
      idUser: server["_id"],
    );
  }
}
