// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/commands.dart';

// ignore: unused_element
Widget buildPopupDialog(BuildContext context, int index) {
  return new AlertDialog(
    title: Center(child: Text("More details about the \n         command")),
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
              padding: EdgeInsets.all(5.0),
              child: Row(
                children: [
                  const Text('Store  : ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  Text(
                    context.watch<Commands>().commands[index].store.name,
                    style: const TextStyle(fontSize: 15),
                  ),
                  
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        const TextSpan(
                            text: 'Phone  : ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15)),
                        TextSpan(
                          text: context
                                  .watch<Commands>()
                                  .commands[index]
                                  .store
                                  .phone +
                              " ",
                          style: const TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
                const Icon(
                  Icons.phone,
                  color: Colors.green,
                  size: 20.0,
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        const TextSpan(
                            text: 'Distance : ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15)),
                        TextSpan(
                          text: context
                                  .watch<Commands>()
                                  .commands[index]
                                  .store
                                  .location
                                  .haversine_distance(36.757154, 10.01386)
                                  .round()
                                  .toString() +
                              " KM ",
                          style: const TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
                const Icon(
                  Icons.social_distance,
                  color: Colors.green,
                  size: 20.0,
                ),
              ],
            ),
            Padding(
                padding: EdgeInsets.all(5.0),
                child: Row(children: [
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        const TextSpan(
                            text: 'Command : ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15)),
                        TextSpan(
                          text: context
                              .watch<Commands>()
                              .commands[index]
                              .description,
                          style: const TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
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
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        const TextSpan(
                            text: 'full Name  : ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15)),
                        TextSpan(
                          text: context
                              .watch<Commands>()
                              .commands[index]
                              .buyer
                              .fullName,
                          style: const TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
                const Icon(
                  Icons.person,
                  color: Colors.grey,
                  size: 20.0,
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                    padding: EdgeInsets.all(5.0),
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          const TextSpan(
                              text: 'Phone  : ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
                          TextSpan(
                            text: context
                                    .watch<Commands>()
                                    .commands[index]
                                    .buyer
                                    .phoneNumber +
                                " ",
                            style: const TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                    )),
                const Icon(
                  Icons.phone,
                  color: Colors.green,
                  size: 20.0,
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        const TextSpan(
                            text: 'distance : ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15)),
                        TextSpan(
                          text: context
                                  .watch<Commands>()
                                  .commands[index]
                                  .buyer
                                  .location
                                  .haversine_distance(36.757154, 10.01386)
                                  .round()
                                  .toString() +
                              " KM ",
                          style: const TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                ),
                const Icon(
                  Icons.social_distance,
                  color: Colors.green,
                  size: 20.0,
                ),
              ],
            ),
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
                            .commands[index]
                            .buyer
                            .location
                            .haversine_distance(36.757154, 10.01386)
                            .round()
                            .toString() +
                        " KM ",
                    style: const TextStyle(fontSize: 15)),
                const Icon(
                  Icons.store,
                  color: Colors.black,
                  size: 36.0,
                ),
                Text(
                    context
                            .watch<Commands>()
                            .commands[index]
                            .buyer
                            .location
                            .haversine_distance(
                                context
                                    .watch<Commands>()
                                    .commands[index]
                                    .store
                                    .location
                                    .coordinates[0],
                                context
                                    .watch<Commands>()
                                    .commands[index]
                                    .buyer
                                    .location
                                    .coordinates[1])
                            .round()
                            .toString() +
                        " KM ",
                    style: const TextStyle(fontSize: 15)),
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
                            side: BorderSide(color: Colors.blue)))),
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
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.green)))),
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('accept'),
      ),
    ],
  );
}
