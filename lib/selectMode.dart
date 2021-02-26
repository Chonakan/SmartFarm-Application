import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:smartfarm/home.dart';
import 'package:smartfarm/home2.dart';

class Mode extends StatefulWidget {
  @override
  _ModeState createState() => _ModeState();
}

class _ModeState extends State<Mode> {
  bool selectMode = false;
  final SetState = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          selectMode == true ? Color(0xffFFF1D1) : Color(0xff53647B),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: selectMode == true
                        ? AssetImage("images/Sg3.png")
                        : AssetImage("images/Sg2.png"),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  onPressed: () {
                    setState(() {
                      selectMode = false;
                    });
                  },
                  child: Text(
                    'Manual',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Color(0xff374251),
                ),
                SizedBox(
                  width: 10,
                ),
                FlatButton(
                  onPressed: () {
                    setState(() {
                      selectMode = true;
                    });
                  },
                  child: Text(
                    'Auto',
                  ),
                  color: Color(0xffFFDF91),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "      Select and Continue",
                  style: TextStyle(
                      color: selectMode == true ? Colors.black : Colors.white),
                ),
                SizedBox(
                  width: 15,
                ),
                IconButton(
                  icon: Icon(Icons.arrow_right_sharp,
                      color: selectMode == true ? Colors.black : Colors.white),
                  onPressed: () {
                    if (selectMode == true) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomeAuto()));
                      SetState.child('Mode').set({'State': 1}); // Auto
                    } else {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Home()));
                      SetState.child('Mode').set({'State': 0}); //Manual
                    }
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
