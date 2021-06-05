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
  bool _showBus = false;
  bool _gameover = false;

  void _bot() {}

  void _checkGame(bool fromBus) {
    if (_n % 5 == 0 && !fromBus && !_gameover) _gameover = true;
    if (_n % 5 != 0 && fromBus && !_gameover) _gameover = true;
    setState(() {});
  }

  void _add() {
    if (!_gameover) {
      _showBus = false;
      _n++;
    }
    _checkGame(false);
  }

  void _bus() {
    if (!_gameover) {
      _showBus = true;
      _n++;
    }
    _checkGame(true);
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
                onPressed: () {
                  _bus();
                },
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
            left: 0,
            right: 0,
            child: _showBus
                ? Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    // width: MediaQuery.of(context).size.width * 0.2,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            fit: BoxFit.fitHeight,
                            image: AssetImage("image/bus1.png"))))
                : (Text('$_n',
                    style: TextStyle(
                        fontSize: 200,
                        color: Colors.black,
                        fontWeight: FontWeight.w300),
                    textAlign: TextAlign.center)),
          ),
          _gameover
              ? Container(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "GAME OVER",
                          style: TextStyle(
                              fontSize: 56,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                _gameover = false;
                                _n = 0;
                                _showBus = false;
                              });
                            },
                            icon: Icon(
                              Icons.restart_alt_rounded,
                              size: 24,
                            ))
                      ],
                    ),
                  ),
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
                )
              : Container(),
        ],
      ),
    );
  }
}
