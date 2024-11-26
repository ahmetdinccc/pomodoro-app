import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pomodoro_app/page/edit_screen.dart';
import 'package:pomodoro_app/page/exam_calendar.dart';
import 'package:pomodoro_app/widget/start_stop_button.dart';
import 'package:pomodoro_app/widget/tools_button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Timer? _timer;
  int _focusMinutes = 25;
  int _focusSeconds = 0;

  int breakMinutes = 5;
  int breakSeconds = 0;

  bool _isRunning = false;
  bool isTime = true;
  bool _wasManuallyStopped = false;

  void _startTimer() {
    if (_timer != null) {
      _timer!.cancel();
    }

    setState(() {
      _isRunning = true;
      _wasManuallyStopped = false;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_focusSeconds > 0) {
          _focusSeconds--;
        } else {
          if (_focusMinutes > 0) {
            _focusMinutes--;
            _focusSeconds = 59;
          } else {
            _timer?.cancel();
            _isRunning = false;
            startBreak();
          }
        }
      });
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    setState(() {
      _isRunning = false;
      _wasManuallyStopped = true;
    });
  }

  void startBreak() {
    setState(() {
      _focusMinutes = breakMinutes;
      _focusSeconds = breakSeconds;
      isTime = false;
    });
  }

  void startFocus() {
    setState(() {
      _focusMinutes = 25;
      _focusSeconds = 0;
      isTime = true;
    });
  }

  void resetTimer() {
    if (_wasManuallyStopped) {
      if (isTime) {
        startFocus();
      } else {
        startBreak();
      }
    } else {
      if (isTime) {
        startFocus();
      } else {
        startBreak();
      }
    }
    setState(() {
      _wasManuallyStopped = false;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF250E42),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Üst Bölüm (Başlık ve Takvim Butonu)
            Stack(
              children: [
                Image.asset(
                  'assets/images/Ellipse 3.png',
                  width: screenWidth,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 45, left: 10, right: 10),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Calendar(),
                          ),
                        );
                      },
                      icon: Image.asset(
                        'assets/images/calendar (1).png',
                        width: 34,
                        height: 34,
                      ),
                    ),
                  ),
                ),
                const Positioned(
                  top: 75,
                  left: 80,
                  child: Text(
                    "Pomodoro App",
                    style: TextStyle(
                      color: Color(0xFF2514EC),
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                    ),
                  ),
                ),
              ],
            ),
            // Zaman Göstergeleri
            Padding(
              padding: const EdgeInsets.only(top: 140, left: 25, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTimeDisplay(
                      value: _focusMinutes.toString().padLeft(2, '0')),
                  const Text(
                    ":",
                    style: TextStyle(fontSize: 64, color: Colors.white),
                  ),
                  _buildTimeDisplay(
                      value: _focusSeconds.toString().padLeft(2, '0')),
                ],
              ),
            ),
            const SizedBox(height: 46),
            // Başlat/Durdur Butonu
            MyStartStop(
              onPressed: _isRunning ? _stopTimer : _startTimer,
              isRunning: _isRunning,
            ),
            const SizedBox(height: 45),
            // Ayarlar ve Reset Butonları
            Visibility(
              visible: !_isRunning,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xB3221674),
                      Color(0x973D25C7),
                      Color(0x8D3A25C6),
                    ],
                  ),
                ),
                height: 220,
                child: Padding(
                  padding: const EdgeInsets.only(top: 35, left: 25, right: 25),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyTools(
                            onPressed: startFocus,
                            mytext: "Çalışma",
                            myfontsize: 20,
                          ),
                          MyTools(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Edit(),
                                ),
                              );
                            },
                            mytext: "Zamanı Kendin Ayarla",
                            myfontsize: 20,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyTools(
                            onPressed: startBreak,
                            mytext: "Mola",
                            myfontsize: 20,
                          ),
                          MyTools(
                            onPressed: resetTimer,
                            mytext: "Sıfırla",
                            myfontsize: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Zaman göstergesi widget
  Widget _buildTimeDisplay({required String value}) {
    return Container(
      height: 185,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(64),
        color: const Color(0xFFD9D9D9),
      ),
      child: Center(
        child: Text(
          value,
          style: const TextStyle(
            fontSize: 64,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
