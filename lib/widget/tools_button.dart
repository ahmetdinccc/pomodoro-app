import 'package:flutter/material.dart';

class MyTools extends StatelessWidget {
  MyTools(
      {super.key,
      required this.mytext,
      required this.myfontsize,
      required this.onPressed});

  String mytext;
  double myfontsize;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 67,
        width: 174,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20))),
          child: Text(
            mytext,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: myfontsize),
          ),
        ));
  }
}
