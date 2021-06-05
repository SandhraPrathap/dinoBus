import 'dart:ui';

import 'package:flutter/material.dart';



void main() {
  runApp(MaterialApp(home: DinoBus()));
}

class DinoBus extends StatefulWidget {
  @override
  _DinoBusState createState() => _DinoBusState();
}

class _DinoBusState extends State<DinoBus> {
  int _n = 0;

  void _add() {
     {
      _n++;
      print('$_n');
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Row(
            children: [
              Text("DinoBus ",
                  style: TextStyle(
                      fontSize: 24,
                      color: Color.fromRGBO(249, 224, 5, 1),
                      fontWeight: FontWeight.bold)),
              Image.asset("image/bus1.png")
            ],
          )),
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    stops: [0.10, 1],
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(17, 16, 16, 1),
                      Color.fromRGBO(249, 224, 5, 1)
                    ])),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.1,
            left: MediaQuery.of(context).size.width * 0.1,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Color.fromRGBO(249, 224, 5, 1),
                ),
                onPressed: () {},
                child: Align(
                    alignment: Alignment.center,
                    child: Center(child: Image.asset("image/bus21.png"))),
              ),
            ),
          ),
          Positioned(
              bottom: MediaQuery.of(context).size.height * 0.1,
              right: MediaQuery.of(context).size.width * 0.1,
              child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Color.fromRGBO(249, 224, 5, 1),
                    ),
                    onPressed: () {
                      _add();
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("+",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 75,
                              color: Color.fromRGBO(249, 224, 5, 1),
                              fontWeight: FontWeight.bold)),
                    ),
                  ))),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.20,
            bottom: 0,
            left: 0,
            right: 0,
            child: Text('$_n',
                style: TextStyle(
                    fontSize: 200,
                    color: Colors.black,
                    fontWeight: FontWeight.w300),
                textAlign: TextAlign.center),
          )
        ],
      ),
    );
  }
}
