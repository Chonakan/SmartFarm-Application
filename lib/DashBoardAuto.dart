import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smartfarm/models/Station2.dart';
import 'package:smartfarm/models/Station3.dart';
import 'models/Station1.dart';

class DashboardAuto extends StatefulWidget {
  @override
  _DashboardAutoState createState() => _DashboardAutoState();
}

class _DashboardAutoState extends State<DashboardAuto> {
  DatabaseReference _st1 =
      FirebaseDatabase.instance.reference().child('Station1');
  DatabaseReference _st2 =
      FirebaseDatabase.instance.reference().child('Station2');
  DatabaseReference _st3 =
      FirebaseDatabase.instance.reference().child('Station3');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _st3.onValue,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var _sta3 = Station3.fromJson(snapshot.data.snapshot.value);
            var ldrval = _sta3.ldr / 100;
            var lightval = _sta3.light / 100;
            var bat3 = _sta3.battery / 100;
            return ListView(
              children: [
                StreamBuilder(
                    stream: _st1.onValue,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        // print(
                        //     'snapshot data => ${snapshot.data.snapshot.value.toString()}');
                        var _sta1 =
                            Station1.fromJson(snapshot.data.snapshot.value);
                        var celcius = _sta1.tempC / 100;
                        var dirtcel = _sta1.tempD / 100;
                        var bat1 = _sta1.battery / 100;
                        return Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      height: 22,
                                      width: 170,
                                      color: Colors.black,
                                      child: Center(
                                        child: Text(
                                          'Temperature (Station 1)',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 60,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'You can scorll it',
                                        style: TextStyle(fontSize: 10),
                                      ),
                                      Icon(
                                        Icons.navigate_next_rounded,
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                  height: 200,
                                  width: double.maxFinite,
                                  // color: Colors.white,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    children: [
                                      SizedBox(
                                        width: 7,
                                      ),
                                      CircularPercentIndicator(
                                        progressColor: Colors.redAccent,
                                        animation: true,
                                        radius: 170,
                                        percent: celcius,
                                        // percent: _sta1.tempC >= 30 ? 0.7 : 0.2,
                                        lineWidth: 10,
                                        circularStrokeCap:
                                            CircularStrokeCap.round,
                                        center: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '${_sta1.tempC} °C',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 7,
                                            ),
                                            Text(
                                              'Temperature',
                                              style: TextStyle(fontSize: 10),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      CircularPercentIndicator(
                                        progressColor: Colors.green,
                                        animation: true,
                                        radius: 170,
                                        percent: dirtcel,
                                        lineWidth: 10,
                                        circularStrokeCap:
                                            CircularStrokeCap.round,
                                        center: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '${_sta1.tempD} °C',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 7,
                                            ),
                                            Text(
                                              'Soil Temperature',
                                              style: TextStyle(fontSize: 10),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      CircularPercentIndicator(
                                        progressColor: Colors.amber,
                                        animation: true,
                                        radius: 170,
                                        percent: bat1,
                                        lineWidth: 10,
                                        circularStrokeCap:
                                            CircularStrokeCap.round,
                                        center: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '${_sta1.battery} %',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 7,
                                            ),
                                            Text(
                                              'Battery Life',
                                              style: TextStyle(fontSize: 10),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )),
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
                        // print(
                        //     'snapshot data => ${snapshot.data.snapshot.value.toString()}');
                        var _sta2 =
                            Station2.fromJson(snapshot.data.snapshot.value);
                        var hum = _sta2.humi / 100;
                        var soil = _sta2.soilmois / 400;
                        var bat2 = _sta2.battery / 100;
                        return Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      height: 22,
                                      width: 270,
                                      color: Colors.black,
                                      child: Center(
                                        child: Text(
                                          'Humidity and Soil Moisture (Station 2)',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(35),
                                child: Container(
                                  height: 370,
                                  width: double.maxFinite,
                                  // color: Colors.white,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // SizedBox(
                                      //   height: 30,
                                      // ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          // SizedBox(
                                          //   width: 2,
                                          // ),
                                          CircularPercentIndicator(
                                            progressColor: Colors.blue,
                                            animation: true,
                                            radius: 170,
                                            percent: hum,
                                            // percent: hum,
                                            lineWidth: 10,
                                            circularStrokeCap:
                                                CircularStrokeCap.round,
                                            center: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '${_sta2.humi} %',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 7,
                                                ),
                                                Text(
                                                  'Humidity',
                                                  style:
                                                      TextStyle(fontSize: 10),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 7,
                                          ),
                                          CircularPercentIndicator(
                                            progressColor: Colors.brown,
                                            animation: true,
                                            radius: 170,
                                            percent: _sta2.soilmois > 400
                                                ? 1.0
                                                : soil,
                                            lineWidth: 10,
                                            circularStrokeCap:
                                                CircularStrokeCap.round,
                                            center: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  '${_sta2.soilmois} %',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 7,
                                                ),
                                                Text(
                                                  'Soil Moisture',
                                                  style:
                                                      TextStyle(fontSize: 10),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        // mainAxisAlignment:
                                        //     MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 7,
                                          ),
                                          CircularPercentIndicator(
                                            progressColor: Colors.amber[600],
                                            animation: true,
                                            radius: 170,
                                            percent: bat2,
                                            lineWidth: 10,
                                            circularStrokeCap:
                                                CircularStrokeCap.round,
                                            center: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons
                                                      .battery_charging_full_rounded,
                                                  color: Colors.amber[600],
                                                ),
                                                SizedBox(
                                                  height: 7,
                                                ),
                                                Text(
                                                  'Battery Life',
                                                  style:
                                                      TextStyle(fontSize: 10),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 40,
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.compare_arrows_sharp,
                                                color: Colors.black,
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                '${_sta2.battery} %',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return Container();
                      }
                    }),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 22,
                        width: 200,
                        color: Colors.black,
                        child: Center(
                          child: Text(
                            'LDR and Light (Station 3)',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 7,
                    ),
                    CircularPercentIndicator(
                      progressColor: Colors.amber[900],
                      animation: true,
                      radius: 170,
                      percent: _sta3.ldr > 100 ? 1.0 : ldrval,
                      lineWidth: 10,
                      circularStrokeCap: CircularStrokeCap.round,
                      center: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.wb_sunny,
                            color: Colors.amber[900],
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            'LDR value',
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Text(
                      '${_sta3.ldr} %',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 7,
                    ),
                    CircularPercentIndicator(
                      progressColor: Colors.green,
                      animation: true,
                      radius: 170,
                      percent: lightval,
                      lineWidth: 10,
                      circularStrokeCap: CircularStrokeCap.round,
                      center: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.lightbulb,
                            color: Colors.green,
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            'Light value',
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Text(
                      '${_sta3.light} %',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 7,
                    ),
                    CircularPercentIndicator(
                      progressColor: Colors.amber,
                      animation: true,
                      radius: 170,
                      percent: bat3,
                      lineWidth: 10,
                      circularStrokeCap: CircularStrokeCap.round,
                      center: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.battery_charging_full_rounded,
                            color: Colors.amber,
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            'Battery Life',
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Text(
                      '${_sta3.battery} %',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
              ],
            );
          } else {
            return Container();
          }
        });
  }
}
