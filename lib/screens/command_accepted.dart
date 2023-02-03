import 'package:appdelivery/Providers/commands.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

import 'details.dart';
import 'details_accept.dart';
import 'nav_Bar.dart';

class AcceptedCommandPage extends StatefulWidget {
  const AcceptedCommandPage({Key? key}) : super(key: key);

  @override
  State<AcceptedCommandPage> createState() => _AcceptedCommandPageState();
}

class _AcceptedCommandPageState extends State<AcceptedCommandPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: const Text("all commands Accepted"),
        centerTitle: true,
      ),
      body: Center(
        child: ListView.separated(
          itemCount: context.watch<Commands>().commandsAccepted.length,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (
                    BuildContext context,
                  ) =>
                      buildPopupDialogAccepted(context, index),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                            context
                                .watch<Commands>()
                                .commandsAccepted[index]
                                .store
                                .name,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                                fontSize: 20)),
                        Text(
                          context
                              .watch<Commands>()
                              .commandsAccepted[index]
                              .date,
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 10),
                        ),
                      ],
                    ),
                    Text(
                      context
                          .watch<Commands>()
                          .commandsAccepted[index]
                          .store
                          .location
                          .city
                          .toUpperCase(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      context
                              .watch<Commands>()
                              .commandsAccepted[index]
                              .store
                              .location
                              .haversine_distance(36.757154, 10.01386)
                              .round()
                              .toString() +
                          "km",
                    ),
                    Text(
                      context.watch<Commands>().commandsAccepted[index].price +
                          "DT",
                    ),
                    const Icon(
                      Icons.run_circle,
                      color: Colors.green,
                      size: 36.0,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {},
        tooltip: 'Increment',
        child: const Icon(Icons.home_sharp),
      ),
    );
  }
}
