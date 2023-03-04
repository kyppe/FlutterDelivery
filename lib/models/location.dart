import 'dart:ffi';
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

        double haversine_distance(double? lat1,double? lng1,) {
          
    if (lat1 != null && lng1 != null)
     {print("aaaaaaa"); 
      var R = 3958.8; // Radius of the Earth in miles
      var rlat1 = lat1 * (pi/180); // Convert degrees to radians
      var rlat2 = coordinates[0] * (pi/180); // Convert degrees to radians
      var difflat = rlat2-rlat1; // Radian difference (latitudes)
      var difflon = (coordinates[1]-lng1) * (pi/180); // Radian difference (longitudes)

      var d = 2 * R * asin(sqrt(sin(difflat/2)*sin(difflat/2)+cos(rlat1)*cos(rlat2)*sin(difflon/2)*sin(difflon/2)));
      print(coordinates[0].toString()+","+coordinates[1].toString());
      print((d*1.60934).toString()+" km");
      return d*1.60934;}
  else {
    print("bbbbbb");
    return 0;
  }
    }
  
  factory Location.fromMap(Map<String, dynamic> location) {
    return Location(
        type: location["type"],
        coordinates: location["coordinates"],
        city: location["city"],
        streetAddress: location["streetAddress"]);
  }
  // ignore: non_constant_identifier_names

}
