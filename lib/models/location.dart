class Location {
  String? type;
  List? coordinates;
  Location({this.type, this.coordinates});
  factory Location.fromMap(Map<String, dynamic> location) {
    return Location(
        type: location["type"], coordinates: location["coordinates"]);
  }
}
