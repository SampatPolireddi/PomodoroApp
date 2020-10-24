import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodo_app/timer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

Future navigateTotimer(context) async {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Pomodoro()));
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.red[200], Colors.red[300], Colors.red],
                  begin: Alignment.topRight,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Column(
              children: <Widget>[
                //icon
                Row(
                  children: <Widget>[
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 100, left: 85, bottom: 100, right: 100),
                        child: Image(
                          image: AssetImage('assets/images/coder.png'),
                          width: 200,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),

                //text
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: Container(
                    child: Text(
                      'Until we can manage time, we can',
                      style: GoogleFonts.cabin(fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    child: Text('manage nothing else.',
                        style: GoogleFonts.cabin(fontSize: 20)),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),

                // button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: RaisedButton(
                        elevation: 5,
                        onPressed: () {
                          navigateTotimer(context);
                        },
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            "Continue",
                            style: GoogleFonts.cabin(fontSize: 18),
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
