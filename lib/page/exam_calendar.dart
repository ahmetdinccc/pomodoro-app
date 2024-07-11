import 'package:flutter/material.dart';
import 'package:pomodoro_app/page/home_screen.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
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
                Padding(
                    padding: const EdgeInsets.only(top: 45, left: 10),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Home()),
                            (route) => false);
                      },
                      icon: Image.asset(
                        'assets/images/back 3.png',
                      ),
                    )),
                const Positioned(
                  top: 75,
                  left: 90,
                  child: Text(
                    "Sınav Takvimi",
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
              height: 56,
            ),
            Stack(children: [
              Center(
                child: Container(
                  width: 372,
                  height: 95,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
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
              )
            ])
          ],
        ),
      ),
    );
  }
}
