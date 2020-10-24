import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Pomodoro extends StatefulWidget {
  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Pomodoro> {
  double percent = 0;
  static int TimeInMin = 25;
  int TimeInSec = TimeInMin * 60;

  Timer timer;

  StartTimer() {
    TimeInMin = 25;
    int Time = TimeInMin * 60;
    double SecPercent = (Time / 100);
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        print("test");

        if (Time > 0) {
          Time--;
          if (Time % 60 == 0) {
            // a minute has passed
            TimeInMin--;
          }
          if (Time % SecPercent == 0) {
            //we want to see 1% equal to how many seconds of our progress bar
            if (percent < 1) {
              percent += 0.01;
            } else {
              percent = 1;
              TimeInMin = 25;
              timer.cancel();
            }
          }
        } else {
          percent = 0;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.grey[100],
                    Colors.red[100],
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
            ),
            Column(
              children: <Widget>[
                //title
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Container(
                        child: Text("Pomodoro",
                            style: GoogleFonts.cabin(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.red[600])),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),

                // percent indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: CircularPercentIndicator(
                        circularStrokeCap: CircularStrokeCap.round,
                        animation: true,
                        percent: percent,
                        animateFromLastPercent: true,
                        radius: 250.0,
                        lineWidth: 15.0,
                        progressColor: Colors.red[600],
                        backgroundColor: Colors.grey[350],
                        center: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "$TimeInMin",
                              style: TextStyle(
                                  fontSize: 80, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Min",
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),

                //button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        StartTimer();
                      },
                      color: Colors.red[600],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Start",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
