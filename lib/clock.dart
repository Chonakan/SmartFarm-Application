import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';
import 'package:smartfarm/settimeLight.dart';
import 'package:smartfarm/settimeNozzle.dart';
import 'package:smartfarm/settimePump.dart';

class Clock extends StatefulWidget {
  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  var dateTime = DateTime.now();

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      // if (!mounted) {
      //   return; // Just do nothing if the widget is disposed.
      // }
      if (mounted) {
        setState(() {
          dateTime = DateTime.now();
        });
      }
    });
    isSelected = [true, false, false];
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<bool> isSelected;

  int _currentIndex = 0;

  final _option = [
    SettimeLight(),
    SettimePump(),
    SettimeNozzle(),
  ];

  DatabaseReference _lt1 =
      FirebaseDatabase.instance.reference().child('Light-Settime');
  // DatabaseReference _pt2 =
  //     FirebaseDatabase.instance.reference().child('Pump-Settime');
  // DatabaseReference _nt3 =
  //     FirebaseDatabase.instance.reference().child('Nozzle-Settime');

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
            ),
            Container(
              width: 300,
              height: 300,
              child: Transform.rotate(
                angle: -pi / 2,
                child: CustomPaint(
                  painter: ClockPainter(),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              '${dateTime.hour} : ${dateTime.minute} : ${dateTime.second}',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            SizedBox(
              height: 45,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Set time to control',
                  style: TextStyle(color: Colors.orange[300], fontSize: 17),
                ),
                ToggleButtons(
                  children: [
                    Icon(
                      Icons.lightbulb,
                      color: Color(0xffFFDF91),
                    ),
                    Icon(
                      Icons.spa,
                      color: Color(0xff94ebcd),
                    ),
                    Icon(
                      Icons.water_damage_rounded,
                      color: Color(0xff9bacf2),
                    ),
                  ],
                  isSelected: isSelected,
                  onPressed: (index) {
                    setState(() {
                      for (var i = 0; i < isSelected.length; i++) {
                        i == index
                            ? isSelected[i] = true
                            : isSelected[i] = false;
                      }
                      _currentIndex = index;
                    });
                  },
                ),
              ],
            ),
            Container(
              child: _option[_currentIndex],
            ),
          ],
        ),
      ),
    );
  }
}

//Create Clock
class ClockPainter extends CustomPainter {
  var dateTime = DateTime.now();
  // 60 sec = 360 degree => 1 sec 6 degree
  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var fillBrush = Paint()..color = Color(0xff49596e);
    var filloutline = Paint()
      ..color = Color(0xffEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    var fillcenterdot = Paint()..color = Color(0xffEAECFF);

    var secBrush = Paint()
      ..color = Colors.orange[300]
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5;

    var minBrush = Paint()
      ..shader = RadialGradient(colors: [Color(0xff748EF6), Color(0xff77DDFF)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    var hourBrush = Paint()
      ..shader = RadialGradient(colors: [Color(0xffEA74AB), Color(0xffC279FB)])
          .createShader(Rect.fromCircle(center: center, radius: radius))
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12;

    var dashBrush = Paint()
      ..color = Colors.white
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawCircle(center, radius - 50, fillBrush);
    canvas.drawCircle(center, radius - 50, filloutline);

    var secHandX = centerX + 80 * cos(dateTime.second * 6 * pi / 180);
    var secHandY = centerX + 80 * sin(dateTime.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secHandX, secHandY), secBrush);

    var minHandX = centerX + 80 * cos(dateTime.minute * 6 * pi / 180);
    var minHandY = centerX + 80 * sin(dateTime.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minHandX, minHandY), minBrush);

    var hourHandX = centerX +
        60 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    var hourHandY = centerX +
        60 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourBrush);

    canvas.drawCircle(center, 13, fillcenterdot);

    var outerCircleRadius = radius;
    var innerCircleRadius = radius - 14;
    for (double i = 0; i < 360; i += 12) {
      var x1 = centerX + outerCircleRadius * cos(i * pi / 180);
      var y1 = centerX + outerCircleRadius * sin(i * pi / 180);
      var x2 = centerX + innerCircleRadius * cos(i * pi / 180);
      var y2 = centerX + innerCircleRadius * sin(i * pi / 180);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
