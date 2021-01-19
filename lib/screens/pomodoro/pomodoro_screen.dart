import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pomodoro_app/constants.dart';

class PomodoroScreen extends StatefulWidget {
  @override
  _PomodoroScreenState createState() => _PomodoroScreenState();
}

class _PomodoroScreenState extends State<PomodoroScreen> {
  double percent = 0;
  static int timeInMinute = 25;
  int timeInSec = timeInMinute * 60;

  Timer timer;

  _startTimer() {
    timeInMinute = 25;
    int time = timeInMinute * 60;
    double secPercent = (time / 100);
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (time > 0) {
          time--;
          if (time % 60 == 0) timeInMinute--;
          if (time % secPercent == 0) if (percent < 1)
            percent += 0.01;
          else
            percent = 1;
        } else {
          percent = 0;
          timeInMinute = 25;
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          kPrimaryColor,
          kSecondaryColor,
        ], begin: FractionalOffset(0.5, 1))),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(top: 18.0),
              child: Text(
                "Pomodoro Clock",
                style: TextStyle(color: Colors.white, fontSize: 40.0),
              ),
            ),
            Expanded(
              child: CircularPercentIndicator(
                circularStrokeCap: CircularStrokeCap.round,
                percent: percent,
                animation: true,
                animateFromLastPercent: true,
                radius: 250.0,
                lineWidth: 20.0,
                progressColor: Colors.white,
                center: Text(
                  "$timeInMinute",
                  style: TextStyle(color: Colors.white, fontSize: 80),
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30))),
                child: Padding(
                  padding: EdgeInsets.only(top: 30, left: 20, right: 20),
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text("Study Timer",
                                      style: TextStyle(fontSize: 20)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "25",
                                    style: TextStyle(fontSize: 70),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text("Pause Time",
                                      style: TextStyle(fontSize: 20)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "5",
                                    style: TextStyle(fontSize: 70),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: RaisedButton(
                            onPressed: _startTimer,
                            color: Colors.blue,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100)),
                            child: Padding(
                              padding: EdgeInsets.all(20),
                              child: Text(
                                "Start Studying",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 22),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
