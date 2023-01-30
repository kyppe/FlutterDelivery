import 'package:appdelivery/models/location.dart';

class Buyer {
  String fullName;
  String phoneNumber;
  Location location;
  Buyer({required this.fullName, required this.phoneNumber, required this.location});
  factory Buyer.fromMap(Map<String, dynamic> server) {
    return Buyer(
      fullName: server["fullName"],
      phoneNumber: server["phoneNumber"],
      location: Location.fromMap(server["location"]),
    );
  }
    Map<String, dynamic> toMap() {
    return {
      "fullName": fullName,
      "phoneNumber": phoneNumber,
      "location": location,

    };
  }
}

