import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ControlAuto extends StatefulWidget {
  @override
  _ControlAutoState createState() => _ControlAutoState();
}

class _ControlAutoState extends State<ControlAuto> {
  bool state;
  bool state2;
  bool state3;

  final SetState = FirebaseDatabase.instance.reference();
  DatabaseReference _st =
      FirebaseDatabase.instance.reference().child('Light_ST');

  DatabaseReference _st2 =
      FirebaseDatabase.instance.reference().child('Pump_ST');

  DatabaseReference _st3 =
      FirebaseDatabase.instance.reference().child('NozzlePump_ST');

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width * 0.85,
            decoration: BoxDecoration(
              color: Color(0xff374251),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Color(0xAA363636),
                  offset: const Offset(0.0, 4.0),
                  blurRadius: 5.0,
                  spreadRadius: 0.2,
                ),
              ],
            ),
            child: Center(
              child: ListTile(
                dense: true,
                trailing: Icon(
                  Icons.check,
                  color: Colors.green,
                  size: 35,
                ),
                title: RichText(
                  text: TextSpan(
                    text: 'ON  ',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'State - Now',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.white)),
                    ],
                  ),
                ),
                subtitle: Text("Last state on => 19 : 23 : 10",
                    style: TextStyle(color: Colors.white54)),
                leading: Icon(
                  Icons.lightbulb,
                  color: Color(0xffFFDF91),
                  size: 30,
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width * 0.85,
            decoration: BoxDecoration(
              color: Color(0xff374251),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Color(0xAA363636),
                  offset: const Offset(0.0, 4.0),
                  blurRadius: 5.0,
                  spreadRadius: 0.2,
                ),
              ],
            ),
            child: Center(
              child: ListTile(
                dense: true,
                trailing: Icon(
                  Icons.cancel_rounded,
                  color: Colors.redAccent,
                  size: 35,
                ),
                title: RichText(
                  text: TextSpan(
                    text: 'OFF  ',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'State - Now',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.white)),
                    ],
                  ),
                ),
                subtitle: Text("Last state on => 17 : 10 : 50",
                    style: TextStyle(color: Colors.white54)),
                leading: Icon(
                  Icons.spa,
                  color: Colors.grey,
                  size: 30,
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: MediaQuery.of(context).size.width * 0.85,
            decoration: BoxDecoration(
              color: Color(0xff374251),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Color(0xAA363636),
                  offset: const Offset(0.0, 4.0),
                  blurRadius: 5.0,
                  spreadRadius: 0.2,
                ),
              ],
            ),
            child: Center(
              child: ListTile(
                dense: true,
                trailing: Icon(
                  Icons.check,
                  color: Colors.green,
                  size: 35,
                ),
                title: RichText(
                  text: TextSpan(
                    text: 'ON  ',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'State - Now',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.white)),
                    ],
                  ),
                ),
                subtitle: Text("Last state on => 10 : 05 : 34",
                    style: TextStyle(color: Colors.white54)),
                leading: Icon(
                  Icons.water_damage_rounded,
                  color: Color(0xff9bacf2),
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
