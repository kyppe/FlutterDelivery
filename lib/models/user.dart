import 'package:appdelivery/models/location.dart';

class User {
  String userName;
  String Token;
  String phone;
  Location location;
  User(
      {required this.userName,
      required this.phone,
      required this.Token,
      required this.location});

  factory User.fromMap(Map<String, dynamic> server) {
    return User(
      userName: server["userName"],
      phone: server["phone"],
      Token: server["Token"],
      location: Location.fromMap(server["location"]),
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "userName": userName,
      "phone": phone,
      "Token": Token,
      "location": location,
    };
  }
}
