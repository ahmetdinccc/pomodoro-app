import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Edit extends StatefulWidget {
  const Edit({super.key});

  @override
  State<Edit> createState() => _EditState();
}

class _EditState extends State<Edit> {
  Timer? _timer;

  int breakMinutes = 5;
  int breakSeconds = 0;

  bool isTime = true;



  void startBreak() {
    setState(() {
      isTime = false;
    });
  }

  void startFocus() {
    setState(() {
    });
  }

  void resetTimer() {
    if (isTime) {
      startFocus();
    } else {
      startBreak();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF250E42),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/Ellipse 3.png',
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                const Positioned(
                  top: 75,
                  left: 90,
                  child: Text(
                    "Zaman Ayarla",
                    style: TextStyle(
                      color: Color(0xFF2514EC),
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 62,
            ),
            SizedBox(
              height: 40,
              width: 217,
              child: TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    label: const Text(
                      "ÇALIŞMA",
                    ),
                    labelStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    )),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 40,
              width: 217,
              child: TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    label: const Text(
                      "MOLA",
                    ),
                    labelStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    )),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 300, left: 200),
              child: Stack(children: [
                Image.asset('assets/images/Ellipse 4.png'),
                Positioned(
                  left: 100,
                  top: 80,
                  child: Stack(children: [
                    Container(
                      width: 76,
                      height: 76,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFF271A7E),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, left: 15),
                      child: IconButton(
                          onPressed: () {},
                          icon: Image.asset('assets/images/check 1.png')),
                    )
                  ]),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
