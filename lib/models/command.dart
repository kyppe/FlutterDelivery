import 'location.dart';

class Command {
  String? description;
  String? idBuyer;
  String? idDriver;
  String? status;
  Location? destination;
  Command(
      {this.description,
      this.idBuyer,
      this.idDriver,
      this.status,
      this.destination});
  factory Command.fromMap(Map<String, dynamic> server) {
    return Command(
      description: server["description"],
      idBuyer: server["idBuyer"],
      status: server["status"],
      idDriver: server["idDriver"],
      destination: Location.fromMap(server["destination"]) ,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "description": description,
      "idBuyer": idBuyer,
      "status": status,
      "idDriver": idDriver,
      "destination": destination,
    };
  }
  
}
