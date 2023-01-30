import 'package:appdelivery/models/store.dart';

import 'location.dart';

class Command {
  String description;
  String idBuyer;
  Store store;
  String status;
  String price;
  String date;

  Command(
      {required this.store,
      required this.date,
      required this.price,
      required this.description,
      required this.idBuyer,
      required this.status,
      });
  factory Command.fromMap(Map<String, dynamic> server) {
    return Command(
      store: Store.fromMap(server["idStore"]),
      date: server["date"],
      description: server["description"],
      price: server["price"],
      idBuyer: server["idBuyer"],
      status: server["status"],

    );
  }
  Map<String, dynamic> toMap() {
    return {
      "store": store,
      "description": description,
      "price": price,
      "idBuyer": idBuyer,
      "status": status,

    };
  }
}
