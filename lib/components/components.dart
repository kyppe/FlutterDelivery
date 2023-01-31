import 'package:flutter/cupertino.dart';

Widget myText(  String title, String text) {
  return 
     Row(
      children: [
        Text(title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
        Text(
          text,
          style: const TextStyle(fontSize: 15),
        ),
      ],
    
  );
}
