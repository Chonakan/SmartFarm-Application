import 'package:flutter/material.dart';
import 'package:smartfarm/setvalLight.dart';
import 'package:smartfarm/setvalNoz.dart';
import 'package:smartfarm/setvalPump.dart';

class SetVal extends StatefulWidget {
  @override
  _SetValState createState() => _SetValState();
}

class _SetValState extends State<SetVal> {
  String temp = "";
  String hum = "";
  String ldr = "";
  String soil = "";
  @override
  void initState() {
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
    LightVal(),
    PumpVal(),
    NozVal(),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 150,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Set your values',
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
                      i == index ? isSelected[i] = true : isSelected[i] = false;
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
    );
  }
}
