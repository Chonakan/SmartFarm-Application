import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:smartfarm/DashBoardAuto.dart';
import 'package:smartfarm/controlAuto.dart';

class HomeAuto extends StatefulWidget {
  @override
  _HomeAutoState createState() => _HomeAutoState();
}

class _HomeAutoState extends State<HomeAuto> {
  int _currentIndex = 1;
  bool modeselect = false;

  final _option = [
    ControlAuto(),
    DashboardAuto(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFF1D1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffFFF1D1),
        centerTitle: true,
        title: Text(
          'Auto Mode',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: _option[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        buttonBackgroundColor: Color(0xff374251),
        color: Color(0xff374251),
        backgroundColor: Color(0xffFFF1D1),
        index: 1,
        items: [
          Icon(
            Icons.stacked_line_chart_rounded,
            color: Color(0xffFFF1D1),
          ),
          Icon(
            Icons.dashboard,
            color: Color(0xffFFF1D1),
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
