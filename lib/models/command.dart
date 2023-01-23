import 'location.dart';

class Command {
  String? description;
  String? idBuyer;
  String? idDriver;
  String? status;
  location? destination;
  Command(
      {this.description,
      this.idBuyer,
      this.idDriver,
      this.status,
      this.destination});
}
