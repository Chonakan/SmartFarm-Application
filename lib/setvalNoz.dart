import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class PumpVal extends StatefulWidget {
  @override
  _PumpValState createState() => _PumpValState();
}

class _PumpValState extends State<PumpVal> {
  var _controllerL1 = TextEditingController();
  var _controllerL2 = TextEditingController();

  final fb = FirebaseDatabase.instance;
  String temp = "";
  String hum = "";

  @override
  Widget build(BuildContext context) {
    final ref = fb.reference().child('PumpVal-auto');
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
                  borderSide: BorderSide(color: Color(0xff94ebcd))),
              labelStyle: TextStyle(color: Color(0xffEAECFF)),
              labelText: "Temperature",
              suffixIcon: IconButton(
                onPressed: () => _controllerL1.clear(),
                icon: Icon(
                  Icons.clear,
                  color: Colors.grey[700],
                ),
              ),
            ),
            onChanged: (val) {
              setState(() {
                temp = val;
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
                  borderSide: BorderSide(color: Color(0xff94ebcd))),
              labelStyle: TextStyle(color: Color(0xffEAECFF)),
              labelText: "Humidity",
              suffixIcon: IconButton(
                onPressed: () => _controllerL2.clear(),
                icon: Icon(
                  Icons.clear,
                  color: Colors.grey[700],
                ),
              ),
            ),
            onChanged: (val) {
              setState(() {
                hum = val;
              });
            },
          ),
        ),
        GestureDetector(
          onTap: () => setState(() {
            if (temp.isEmpty && hum.isEmpty) {
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
                              "You didn't set values",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Please set your values",
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
            } else if (temp.isNotEmpty && hum.isNotEmpty) {
              ref.child("Temp-Auto").set(temp);
              ref.child("Humidity-Auto").set(hum);

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
                              Icons.settings_brightness_sharp,
                              color: Colors.black,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Value has been set",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "The pump will turn on at the specified value",
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
          }),
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.85,
              color: Color(0xff9bacf2),
              child: Center(
                child: Text(
                  'Set value',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
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
