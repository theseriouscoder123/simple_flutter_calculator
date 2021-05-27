import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var number1 = 0;
  var number2 = 0;
  var result = 0;
  String operation = "operation";
  final TextEditingController text1 = TextEditingController(text: '0');
  final TextEditingController text2 = TextEditingController(text: '0');
  bool enable = true;
  void add() {
    setState(() {
      number1 = int.parse(text1.text);
      number2 = int.parse(text2.text);
      operation = "+";
      result = number1 + number2;
      bool enable = false;
    });
  }

  void subtract() {
    setState(() {
      number1 = int.parse(text1.text);
      number2 = int.parse(text2.text);
      operation = "-";
      result = number1 - number2;
    });
  }

  void divide() {
    setState(() {
      number1 = int.parse(text1.text);
      number2 = int.parse(text2.text);
      operation = "/";
      result = number1 ~/ number2;
    });
  }

  void multiply() {
    setState(() {
      number1 = int.parse(text1.text);
      number2 = int.parse(text2.text);
      operation = "*";
      result = number1 * number2;
    });
  }

  void clear() {
    setState(() {
      text1.text = '0';
      text2.text = "0";
      operation = "operation";
    });
  }

  void reset() {
    setState(() {
      result = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: Text("Caclculator")),
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: '1st number',
                    ),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    controller: text1,
                    onChanged: (textNumber1) => setState(() {}),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: '2nd number',
                    ),
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (textNumber2) => setState(() {}),
                    controller: text2,
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: Column(
                      children: <Widget>[
                        RaisedButton(
                          onPressed: add,
                          child: Text('+'),
                          color: Colors.amber,
                        ),
                        RaisedButton(
                          onPressed: subtract,
                          child: Text('-'),
                          color: Colors.amber,
                        ),
                        RaisedButton(
                          onPressed: divide,
                          child: Text('/'),
                          color: Colors.amber,
                        ),
                        RaisedButton(
                          onPressed: multiply,
                          child: Text('*'),
                          color: Colors.amber,
                        ),
                        RaisedButton(
                          onPressed: () {
                            clear();
                            reset();
                          },
                          child: Text('Clear'),
                          color: Colors.amber,
                        ),
                        Container(
                          child: Row(children: <Widget>[
                            Container(
                              child: Text(
                                text1.text,
                                style: TextStyle(
                                    fontSize: 24, color: Colors.black26),
                              ),
                              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            ),
                            Container(
                                child: Text(
                                  operation,
                                  style: TextStyle(
                                      fontSize: 24, color: Colors.black26),
                                ),
                                margin: EdgeInsets.fromLTRB(10, 10, 10, 10)),
                            Container(
                              child: Text(text2.text,
                                  style: TextStyle(
                                      fontSize: 24, color: Colors.black26)),
                              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            ),
                            Container(
                              child: Text("=",
                                  style: TextStyle(
                                      fontSize: 24, color: Colors.black26)),
                              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            ),
                            Container(
                              child: Text("$result",
                                  style: TextStyle(
                                      fontSize: 24, color: Colors.black26)),
                              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            )
                          ]),
                          margin: EdgeInsets.all(10),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
