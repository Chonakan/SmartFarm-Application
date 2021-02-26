import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:smartfarm/DashBoard.dart';
import 'package:smartfarm/setval.dart';
import 'DashBoard.dart';
import 'package:smartfarm/clock.dart';
import 'package:smartfarm/control.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 1;
  final _option = [
    Control(),
    Dashboard(),
    Clock(),
    SetVal(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff374251),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xff374251),
        centerTitle: true,
        title: Text(
          'Smart Greenhouse',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: _option[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: Colors.white,
        backgroundColor: Color(0xff374251),
        index: 1,
        items: [
          Icon(
            Icons.control_camera_rounded,
            color: Color(0xff374251),
          ),
          Icon(
            Icons.dashboard,
            color: Color(0xff374251),
          ),
          Icon(
            Icons.timer,
            color: Color(0xff374251),
          ),
          Icon(
            Icons.thermostat_sharp,
            color: Color(0xff374251),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
