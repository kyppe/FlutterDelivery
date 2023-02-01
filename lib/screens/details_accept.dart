// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/commands.dart';
import '../components/components.dart';
// ignore: unused_element

Widget buildPopupDialogAccepted(BuildContext context, int index) {
  return new AlertDialog(
    title:
        const Center(child: Text("More details about the \n         command")),
    content: //Center(
        //child:
        new SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          /*the part of the store*/

          children: <Widget>[
            const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                "Store",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: myText('Store  : ',
                  context.watch<Commands>().commandsAccepted[index].store.name),
            ),
            Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    myText(
                        'Phone  : ',
                        context
                            .watch<Commands>()
                            .commandsAccepted[index]
                            .store
                            .phone),
                    const Icon(
                      Icons.phone,
                      color: Colors.green,
                      size: 20.0,
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: [
                  myText(
                      'Distance  : ',
                      context
                              .watch<Commands>()
                              .commandsAccepted[index]
                              .store
                              .location
                              .haversine_distance(36.757154, 10.01386)
                              .round()
                              .toString() +
                          " KM "),
                  const Icon(
                    Icons.social_distance,
                    color: Colors.green,
                    size: 20.0,
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(children: [
                  myText(
                    'Command : ',
                    context
                        .watch<Commands>()
                        .commandsAccepted[index]
                        .description,
                  ),
                  const Icon(
                    Icons.add_shopping_cart_rounded,
                    color: Colors.grey,
                    size: 20.0,
                  ),
                ])),
            /* part of Buyer*/
            const Padding(
              padding: EdgeInsets.all(15),
              child: Divider(color: Colors.grey),
            ),
            const Text(
              "Buyer",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    myText(
                        'full Name  : ',
                        context
                            .watch<Commands>()
                            .commandsAccepted[index]
                            .buyer
                            .fullName),
                    const Icon(
                      Icons.person,
                      color: Colors.grey,
                      size: 20.0,
                    ),
                  ],
                )),
            Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    myText(
                        "Phone  : ",
                        context
                            .watch<Commands>()
                            .commandsAccepted[index]
                            .buyer
                            .phoneNumber),
                    const Icon(
                      Icons.phone,
                      color: Colors.green,
                      size: 20.0,
                    ),
                  ],
                )),
            Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    myText(
                        "distance : ",
                        context
                            .watch<Commands>()
                            .commandsAccepted[index]
                            .buyer
                            .location
                            .haversine_distance(36.757154, 10.01386)
                            .round()
                            .toString()),
                    const Icon(
                      Icons.social_distance,
                      color: Colors.green,
                      size: 20.0,
                    ),
                  ],
                )),
            const Padding(
              padding: EdgeInsets.all(15),
              child: Divider(color: Colors.grey),
            ),
            Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: Colors.black,
                  size: 36.0,
                ),
                Text(
                    context
                            .watch<Commands>()
                            .commandsAccepted[index]
                            .buyer
                            .location
                            .haversine_distance(36.757154, 10.01386)
                            .round()
                            .toString() +
                        " KM ",
                    style: const TextStyle(fontSize: 10)),
                const Icon(
                  Icons.store,
                  color: Colors.black,
                  size: 36.0,
                ),
                Text(
                    context
                            .watch<Commands>()
                            .commandsAccepted[index]
                            .buyer
                            .location
                            .haversine_distance(
                                context
                                    .watch<Commands>()
                                    .commandsAccepted[index]
                                    .store
                                    .location
                                    .coordinates[0],
                                context
                                    .watch<Commands>()
                                    .commandsAccepted[index]
                                    .buyer
                                    .location
                                    .coordinates[1])
                            .round()
                            .toString() +
                        " KM ",
                    style: const TextStyle(fontSize: 10)),
                const Icon(
                  Icons.person,
                  color: Colors.black,
                  size: 36.0,
                ),
              ],
            ),
            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: const BorderSide(color: Colors.blue),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('See google map path '),
              ),
            )
          ],
        ),
      ),
      // ),
    ),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('Close'),
      ),
      ElevatedButton(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: Colors.red)))),
        onPressed: () {
          Provider.of<Commands>(context, listen: false).abandonedCommand(index);
          Navigator.of(context).pop();
        },
        child: const Text('Abandoned'),
      ),
      ElevatedButton(
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: Colors.green)))),
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('Done'),
      ),
    ],
  );
}
