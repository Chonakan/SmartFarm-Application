import 'package:firebase_database/firebase_database.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:smartfarm/models/Status.dart';

class Statatistic extends StatefulWidget {
  @override
  _StatatisticState createState() => _StatatisticState();
}

class _StatatisticState extends State<Statatistic> {
  var datetime = DateTime.now();

  final SetState = FirebaseDatabase.instance.reference();
  DatabaseReference _st =
      FirebaseDatabase.instance.reference().child('Light_ST');

  DatabaseReference _st2 =
      FirebaseDatabase.instance.reference().child('Pump_ST');

  DatabaseReference _st3 =
      FirebaseDatabase.instance.reference().child('NozzlePump_ST');

  final List<Color> gradientColors = [
    const Color(0xff7b4397),
    const Color(0xffdc2430),
    const Color(0xff6A9113)
  ];

  var time = DateTime.tuesday;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                StreamBuilder(
                    stream: _st.onValue,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var _st = St.fromJson(snapshot.data.snapshot.value);
                        return Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Color(0xff53647B),
                            borderRadius: BorderRadius.circular(22),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xAA363636),
                                offset: const Offset(0.0, 4.0),
                                blurRadius: 10.0,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.lightbulb,
                                    color: _st.status == 1
                                        ? Color(0xffFFDF91)
                                        : Colors.grey,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  _st.status == 1
                                      ? Text(
                                          'ON',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.green),
                                        )
                                      : Text(
                                          'OFF',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.redAccent),
                                        )
                                ],
                              ),
                            ],
                          ),
                        );
                      } else {
                        return Container();
                      }
                    }),
                StreamBuilder(
                    stream: _st2.onValue,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var _st = St.fromJson(snapshot.data.snapshot.value);
                        return Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Color(0xff53647B),
                            borderRadius: BorderRadius.circular(22),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xAA363636),
                                offset: const Offset(0.0, 4.0),
                                blurRadius: 10.0,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.grass,
                                    color: _st.status == 1
                                        ? Color(0xff94ebcd)
                                        : Colors.grey,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  _st.status == 1
                                      ? Text(
                                          'ON',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.green),
                                        )
                                      : Text(
                                          'OFF',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.redAccent),
                                        )
                                ],
                              ),
                            ],
                          ),
                        );
                      } else {
                        return Container();
                      }
                    }),
                StreamBuilder(
                    stream: _st3.onValue,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var _st = St.fromJson(snapshot.data.snapshot.value);
                        return Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Color(0xff53647B),
                            borderRadius: BorderRadius.circular(22),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xAA363636),
                                offset: const Offset(0.0, 4.0),
                                blurRadius: 10.0,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.water_damage_rounded,
                                    color: _st.status == 1
                                        ? Color(0xff9bacf2)
                                        : Colors.grey,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  _st.status == 1
                                      ? Text(
                                          'ON',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.green),
                                        )
                                      : Text(
                                          'OFF',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.redAccent),
                                        )
                                ],
                              ),
                            ],
                          ),
                        );
                      } else {
                        return Container();
                      }
                    }),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Container(
                color: Color(0xAA363636),
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width * 0.95,
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: LineChart(
                    LineChartData(
                        maxX: 11,
                        minX: 0,
                        minY: 0,
                        maxY: 6,
                        // titlesData: LineTitles.getTitleData(),
                        gridData: FlGridData(
                          show: true,
                          getDrawingHorizontalLine: (value) {
                            return FlLine(
                              color: Color(0xff37434d),
                              strokeWidth: 1,
                            );
                          },
                          drawVerticalLine: true,
                          getDrawingVerticalLine: (value) {
                            return FlLine(
                              color: Color(0xff37434d),
                              strokeWidth: 1,
                            );
                          },
                        ),
                        borderData: FlBorderData(
                            show: true,
                            border:
                                Border.all(color: Color(0xff37434d), width: 1)),
                        lineBarsData: [
                          LineChartBarData(
                              spots: [
                                FlSpot(0, 3),
                                FlSpot(2.6, 2),
                                FlSpot(4.9, 5),
                                FlSpot(6.8, 2.5),
                                FlSpot(8, 4),
                                FlSpot(9.5, 3),
                                FlSpot(11, 4),
                              ],
                              isCurved: true,
                              colors: gradientColors,
                              barWidth: 5,
                              dotData: FlDotData(show: false),
                              belowBarData: BarAreaData(
                                show: true,
                                colors: gradientColors
                                    .map((color) => color.withOpacity(0.4))
                                    .toList(),
                              ))
                        ]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class LineTitles {
//   static getTitleData() {
//     FlTitlesData(
//         show: true,
//         bottomTitles: SideTitles(
//             showTitles: true,
//             reservedSize: 22,
//             getTextStyles: (value) => TextStyle(
//                 color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
//             getTitles: (value) {
//               switch (value.toInt()) {
//                 case 2:
//                   return "MAR";
//                 case 5:
//                   return "JUN";
//                 case 8:
//                   return "SEP";
//                   break;
//                 default:
//               }
//               return '';
//             },
//             margin: 8));
//   }
// }
