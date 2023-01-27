import 'location.dart';

class Command {
  String description;
  String idBuyer;
  String idDriver;
  String idStore;
  String status;
  String price;
  String date;
  Location destination;
  Command(
      {required this.idStore,
      required this.date,
      required this.price,
      required this.description,
      required this.idBuyer,
      required this.idDriver,
      required this.status,
      required this.destination});
  factory Command.fromMap(Map<String, dynamic> server) {
    return Command(
      idStore: server["idStore"],
      date: server["date"],
      description: server["description"],
      price: server["price"],
      idBuyer: server["idBuyer"],
      status: server["status"],
      idDriver: server["idDriver"],
      destination: Location.fromMap(server["destination"]),
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "idStore": idStore,
      "description": description,
      "price": price,
      "idBuyer": idBuyer,
      "status": status,
      "idDriver": idDriver,
      "destination": destination,
    };
  }
}
