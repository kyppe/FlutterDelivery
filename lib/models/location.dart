import 'dart:math';

class Location {
  String type;
  List coordinates;
  String city;
  String streetAddress;
  Location(
      {required this.type,
      required this.coordinates,
      required this.city,
      required this.streetAddress});
  factory Location.fromMap(Map<String, dynamic> location) {
    return Location(
        type: location["type"],
        coordinates: location["coordinates"],
        city: location["city"],
        streetAddress: location["streetAddress"]);
  }
  // ignore: non_constant_identifier_names

}
