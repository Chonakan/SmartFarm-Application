import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class NozVal extends StatefulWidget {
  @override
  _NozValState createState() => _NozValState();
}

class _NozValState extends State<NozVal> {
  var _controllerL3 = TextEditingController();

  final fb = FirebaseDatabase.instance;

  String soil = "";
  @override
  Widget build(BuildContext context) {
    final ref = fb.reference().child('NozVal-auto');
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: TextField(
            controller: _controllerL3,
            keyboardType: TextInputType.number,
            style: TextStyle(color: Color(0xffEAECFF)),
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xff94ebcd))),
              labelStyle: TextStyle(color: Color(0xffEAECFF)),
              labelText: "Soil Moisture",
              suffixIcon: IconButton(
                onPressed: () => _controllerL3.clear(),
                icon: Icon(
                  Icons.clear,
                  color: Colors.grey[700],
                ),
              ),
            ),
            onChanged: (val) {
              setState(() {
                soil = val;
              });
            },
          ),
        ),
        GestureDetector(
          onTap: () => setState(() {
            if (soil.isEmpty) {
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
            } else if (soil.isNotEmpty) {
              ref.child("SoilMoisture-Auto").set(soil);
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
            _controllerL3.clear();
          }),
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.85,
              color: Color(0xff94ebcd),
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
