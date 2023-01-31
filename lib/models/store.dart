import 'package:appdelivery/models/location.dart';

class Store {
  String name;
  String phone;
  Location location;
  Store({required this.name, required this.phone, required this.location});
  factory Store.fromMap(Map<String, dynamic> server) {
    return Store(
      name: server["name"],
      phone: server["phone"],
      location: Location.fromMap(server["location"]),
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "phone": phone,
      "location": location,
    };
  }
}
