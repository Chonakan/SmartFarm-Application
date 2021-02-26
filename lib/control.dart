import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:smartfarm/models/Status.dart';

class Control extends StatefulWidget {
  @override
  _ControlState createState() => _ControlState();
}

class _ControlState extends State<Control> {
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
    return ListView(
      padding: EdgeInsets.only(
        top: 70,
      ),
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StreamBuilder(
            stream: _st.onValue,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var _st = St.fromJson(snapshot.data.snapshot.value);
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Light panel  ',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'control',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffFFDF91),
                                      fontSize: 17)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.lightbulb,
                          size: 40,
                          color:
                              _st.status == 1 ? Color(0xffFFDF91) : Colors.grey,
                        ),
                        LiteRollingSwitch(
                          value: false,
                          textOn: "ON",
                          textOff: "OFF",
                          colorOn: Colors.green,
                          colorOff: Colors.redAccent,
                          iconOn: Icons.done_rounded,
                          iconOff: Icons.cancel,
                          textSize: 16,
                          onChanged: (state) {
                            if (state == true) {
                              SetState.child('Light_ST').set({'State': 1});
                            } else {
                              SetState.child('Light_ST').set({'State': 0});
                            }
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 60,
                    ),
                  ],
                );
              } else {
                return Text('');
              }
            }),
        StreamBuilder(
            stream: _st2.onValue,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var _st2 = St.fromJson(snapshot.data.snapshot.value);
                return Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Water pump  ',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'control',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff94ebcd),
                                      fontSize: 17)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.grass,
                          size: 40,
                          color: _st2.status == 1
                              ? Color(0xff94ebcd)
                              : Colors.grey,
                        ),
                        LiteRollingSwitch(
                          value: false,
                          textOn: "ON",
                          textOff: "OFF",
                          colorOn: Colors.green,
                          colorOff: Colors.redAccent,
                          iconOn: Icons.done_rounded,
                          iconOff: Icons.cancel,
                          textSize: 16,
                          onChanged: (state2) {
                            if (state2 == true) {
                              SetState.child('Pump_ST').set({'State': 1});
                            } else {
                              SetState.child('Pump_ST').set({'State': 0});
                            }
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 60,
                    ),
                  ],
                );
              } else {
                return Text('');
              }
            }),
        StreamBuilder(
            stream: _st3.onValue,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var _st3 = St.fromJson(snapshot.data.snapshot.value);
                return Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Nozzle  ',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'control',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff9bacf2),
                                      fontSize: 17)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(
                          Icons.water_damage_rounded,
                          size: 40,
                          color: _st3.status == 1
                              ? Color(0xff9bacf2)
                              : Colors.grey,
                        ),
                        LiteRollingSwitch(
                          value: false,
                          textOn: "ON",
                          textOff: "OFF",
                          colorOn: Colors.green,
                          colorOff: Colors.redAccent,
                          iconOn: Icons.done_rounded,
                          iconOff: Icons.cancel,
                          textSize: 16,
                          onChanged: (state3) {
                            if (state3 == true) {
                              SetState.child('NozzlePump_ST').set({'State': 1});
                            } else {
                              SetState.child('NozzlePump_ST').set({'State': 0});
                            }
                          },
                        ),
                      ],
                    )
                  ],
                );
              } else {
                return Text('');
              }
            }),
      ],
    );
  }
}
