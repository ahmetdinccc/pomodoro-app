import 'package:flutter/material.dart';

class MyStartStop extends StatelessWidget {
  const MyStartStop({
    super.key,
    required this.onPressed,
    required this.isRunning,
  });
  final VoidCallback onPressed;
  final bool isRunning;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 46,
        width: 341,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: Text(
            isRunning ? 'DURDURMAK İÇİN DOKUN' : 'BAŞLAMAK İÇİN DOKUN',
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ));
  }
}
