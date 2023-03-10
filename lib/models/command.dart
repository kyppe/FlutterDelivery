import 'package:appdelivery/models/buyer.dart';
import 'package:appdelivery/models/store.dart';

import 'location.dart';

class Command {
  String description;
  String idCommand;
  Buyer buyer;
  String? idDriver;
  Store store;
  String status;
  String price;
  String date;

  Command({
    required this.idCommand,
    required this.store,
    required this.date,
    required this.price,
    required this.description,
    required this.buyer,
    this.idDriver,
    required this.status,
  });
  factory Command.fromMap(Map<String, dynamic> server) {
    return Command(
      store: Store.fromMap(server["idStore"]),
      date: server["date"],
      idCommand: server["_id"],
      description: server["description"],
      price: server["price"],
      buyer: Buyer.fromMap(server["idBuyer"]),
      idDriver: server["idDriver"],
      status: server["status"],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      "store": store,
      "description": description,
      "price": price,
      "idBuyer": buyer,
      "idCommand": idCommand,
      "status": status,
      "idDriver": idDriver,
    };
  }
}
