import 'package:flutter/material.dart';

class MyCalenderCard extends StatelessWidget {
  const MyCalenderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Container(
            width: 372,
            height: 95,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
          ),
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(top: 18, left: 80),
        child: Text(
          "TYT",
          style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
      ),
      const Padding(
        padding: EdgeInsets.only(top: 61, left: 78),
        child: Text(
          "14-06-2025",
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
      ),
      Center(
        child: Container(
          width: 1,
          height: 95,
          color: const Color(0xFF959595),
        ),
      ),
      const Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.only(top: 18, left: 180),
          child: Text(
            "GÜN",
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      const Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.only(top: 61, left: 180),
          child: Text(
            "354",
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ]);
  }
}
