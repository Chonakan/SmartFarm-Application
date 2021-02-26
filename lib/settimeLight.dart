import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class SettimeLight extends StatefulWidget {
  @override
  _SettimeLightState createState() => _SettimeLightState();
}

class _SettimeLightState extends State<SettimeLight> {
  var _controllerL1 = TextEditingController();
  var _controllerL2 = TextEditingController();
  var _controllerL3 = TextEditingController();
  var _controllerL4 = TextEditingController();

  final fb = FirebaseDatabase.instance;
  String starthour = "";
  String startminute = "";
  String endhour = "";
  String endminute = "";

  @override
  Widget build(BuildContext context) {
    final ref = fb.reference().child('Light-Settime');
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: TextField(
            controller: _controllerL1,
            keyboardType: TextInputType.number,
            style: TextStyle(color: Color(0xffEAECFF)),
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffFFDF91))),
              labelStyle: TextStyle(color: Color(0xffEAECFF)),
              labelText: "Start hour :",
              suffixIcon: IconButton(
                onPressed: () => _controllerL1.clear(),
                icon: Icon(
                  Icons.clear,
                  color: Colors.grey[700],
                ),
              ),
            ),
            onChanged: (val) {
              starthour = val.trim();
              setState(() {
                starthour = val;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: TextField(
            controller: _controllerL2,
            keyboardType: TextInputType.number,
            style: TextStyle(color: Color(0xffEAECFF)),
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffFFDF91))),
              labelStyle: TextStyle(color: Color(0xffEAECFF)),
              labelText: "Start minute :",
              suffixIcon: IconButton(
                onPressed: () => _controllerL2.clear(),
                icon: Icon(
                  Icons.clear,
                  color: Colors.grey[700],
                ),
              ),
            ),
            onChanged: (val) {
              startminute = val.trim();
              setState(() {
                startminute = val;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: TextField(
            controller: _controllerL3,
            keyboardType: TextInputType.number,
            style: TextStyle(color: Color(0xffEAECFF)),
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffFFDF91))),
              labelStyle: TextStyle(color: Color(0xffEAECFF)),
              labelText: "End hour :",
              suffixIcon: IconButton(
                onPressed: () => _controllerL3.clear(),
                icon: Icon(
                  Icons.clear,
                  color: Colors.grey[700],
                ),
              ),
            ),
            onChanged: (val) {
              endhour = val.trim();
              setState(() {
                endhour = val;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 50),
          child: TextField(
            controller: _controllerL4,
            keyboardType: TextInputType.number,
            style: TextStyle(color: Color(0xffEAECFF)),
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xffFFDF91))),
              labelStyle: TextStyle(color: Color(0xffEAECFF)),
              labelText: "End minute :",
              suffixIcon: IconButton(
                onPressed: () => _controllerL4.clear(),
                icon: Icon(
                  Icons.clear,
                  color: Colors.grey[700],
                ),
              ),
            ),
            onChanged: (val) {
              endminute = val.trim();
              setState(() {
                endminute = val;
              });
            },
          ),
        ),
        GestureDetector(
          onTap: () => setState(() {
            if (starthour.isEmpty &&
                startminute.isEmpty &&
                endhour.isEmpty &&
                endminute.isEmpty) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Container(
                        height: 200,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 45,
                            ),
                            Icon(
                              Icons.format_quote_sharp,
                              color: Colors.amber[900],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "You didn't set the time",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Please set the time",
                              style: TextStyle(
                                  fontSize: 12, color: Colors.black54),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    "OK",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  });
            } else if (starthour.isNotEmpty &&
                startminute.isNotEmpty &&
                endhour.isNotEmpty &&
                endminute.isNotEmpty) {
              ref.child("Start-Hour").set(starthour);
              ref.child("Start-Minute").set(startminute);
              ref.child("Stop-Hour").set(endhour);
              ref.child("Stop-Minute").set(endminute);
              showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Container(
                        height: 200,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 45,
                            ),
                            Icon(
                              Icons.lightbulb,
                              color: Color(0xffFFDF91),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Time has been set",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "The light will turn on at the specified time",
                              style: TextStyle(
                                  fontSize: 12, color: Colors.black54),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    "OK",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  });
            } else if (starthour.isNotEmpty &&
                startminute.isEmpty &&
                endhour.isNotEmpty &&
                endminute.isEmpty) {
              ref.child("Start-Hour").set(starthour);
              ref.child("Start-Minute").set("0");
              ref.child("Stop-Hour").set(endhour);
              ref.child("Stop-Minute").set("0");
              showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Container(
                        height: 200,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 45,
                            ),
                            Icon(
                              Icons.lightbulb,
                              color: Color(0xffFFDF91),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Time has been set",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "The light will turn on at the specified time",
                              style: TextStyle(
                                  fontSize: 12, color: Colors.black54),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    "OK",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  });
            } else if (starthour.isEmpty && startminute.isNotEmpty ||
                endhour.isEmpty && endminute.isNotEmpty) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Container(
                        height: 200,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 45,
                            ),
                            Icon(
                              Icons.format_quote_sharp,
                              color: Colors.amber[900],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "You didn't set start-hour or end-hour",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Please set start-hour and end-hour",
                              style: TextStyle(
                                  fontSize: 12, color: Colors.black54),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    "OK",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  });
            } else if (starthour.isEmpty && startminute.isEmpty ||
                endhour.isEmpty && endminute.isEmpty) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Container(
                        height: 200,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 45,
                            ),
                            Icon(
                              Icons.format_quote_sharp,
                              color: Colors.amber[900],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "You didn't set start-hour or end-hour",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Please set start-hour and end-hour",
                              style: TextStyle(
                                  fontSize: 12, color: Colors.black54),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    "OK",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  });
            }
            _controllerL1.clear();
            _controllerL2.clear();
            _controllerL3.clear();
            _controllerL4.clear();
          }),
          child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width * 0.85,
            color: Color(0xffFFDF91),
            child: Center(
              child: Text(
                'Set time',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 65,
        ),
      ],
    );
  }
}
