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
  bool _gameOver = false;

  void _add() {
    _showBus = false;
    _n++;
    if (_n % 5 == 0) {
      _gameOver = true;
    }
    setState(() {});
  }

  void _bus() {
   _n++;

    setState(() {
      _showBus = true;
      
    });

    if (_n % 5 != 0) {
      _gameOver = true;
    }
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
        children: _gameOver
            ? (<Widget>[
                Container(
                    color: Colors.red,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                        child: Text(
                      "Game Over",
                      style:
                          TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                    )))
              ])
            : (<Widget>[
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
                         Future.delayed(Duration(milliseconds:500), () {

                              if (_n % 5 == 0)
                                _add();
                              
                            });
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
                            Future.delayed(Duration(milliseconds:500), () {
                              if((_n+1)%5==0)
                              _bus();
                              else if (_n % 5 != 0)
                                {_add();}
                              
                            });
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
                          decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                  fit: BoxFit.fitHeight,
                                  image: AssetImage("image/bus10.png"))))
                      : (Text('$_n',
                          style: TextStyle(
                              fontSize: 200,
                              color: Colors.black,
                              fontWeight: FontWeight.w300),
                          textAlign: TextAlign.center)),
                )
              ]),
      ),
    );
  }
}
