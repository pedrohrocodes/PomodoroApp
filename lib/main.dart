import 'package:flutter/material.dart';
import 'package:pomodoro_app/screens/pomodoro/pomodoro_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pomodoro App',
      home: PomodoroScreen(),
    );
  }
}
