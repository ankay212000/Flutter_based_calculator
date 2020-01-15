import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Calculator(),
    theme: ThemeData(
      primaryColor: Colors.black,
    ),
  ));
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var result = "0";
  var answer = 0.0;
  var num1=0.0,num2=0.0;
  var i = 0,p=0,decimal=0,q=1;
  String operator = "";

  void calculate(String pressed) {
    if (pressed == "AC") {
      answer = 0.0;
      operator='';
      num1 = 0.0;
      num2 = 0.0;
      i = 0;
      p=0;
      q=1;
      setState(() {
        result = "0";
      });
    } else if (pressed == "+" || pressed == "-" || pressed == "\u00F7" || pressed == "*") {
      if(p==1){
        if (operator == "+") {
          num1 = num1 + num2;
        } else if (operator == "-") {
          num1 = num1 - num2;
        } else if (operator == "\u00F7") {
          num1 = (num2 / num1);
        } else if (operator == "*") {
          num1 = num1 * num2;
        }
        setState(() {
          result = num1.toString()+pressed;
        });
        num2 = num1;
        num1 = 0.0;
      } else {
        num2 = num1;
        num1 = 0.0;
        setState(() {
          result = result + pressed;
        });
        p=1;
      }
      operator = pressed;
    } else if (pressed == "=") {
      if (operator == "+") {
        answer = num1 + num2;
      } else if (operator == "-") {
        answer = num2 - num1;
      } else if (operator == "\u00F7") {
        answer = (num2 / num1);
      } else if (operator == "*") {
        answer = num1 * num2;
      }
      num1 = answer;
      setState(() {
        result = answer.toString();
      });
      answer = 0.0;
      num2 = 0.0;
      p=0;
      q=1;
    } else if (pressed == "cut") {
      var lengthString = result.length;
      if (lengthString == 1) {
        answer = 0.0;
        num1 = 0.0;
        num2 = 0.0;
        i = 0;
        p=0;
        q=1;
        operator='';
        setState(() {
          result = "0";
        });
      } else {
        setState(() {
          result = result.substring(0, lengthString - 1);
        });
      }
    }else if(pressed=='percent'){
      answer = num1/100;
      num1 = answer;
      setState(() {
        result = answer.toString();
      });
    } else {
      if(p==1&&operator=='-'){
        num1=num1*10+double.parse(pressed);
        num1=0-num1;
        setState(() {
          result = result.substring(0, 0);
          result = result+num1.toString();
        });
        p=0;
        q=0;
      }
      else{
        num1 = num1*10+double.parse(pressed);
        if (i == 0) {
          if(operator.isNotEmpty){
            setState(() {
              result = result + num1.toString();
            });
          }else{
            setState(() {
              result = result.substring(0, 0);
              result = result + pressed;
            });
          }
          i = 1;
        } else {
          setState(() {
            result = result + pressed;
          });
        }
      }
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Align(
          child: Scaffold(
            appBar: AppBar(
              title: Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: Text(
                  "    Calculator",
                  style: TextStyle(color: Colors.orange),
                ),
              ),
            ),
            backgroundColor: Colors.black,
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 47),
            child: Text(
              "     Life",
              style: TextStyle(
                  color: Colors.white70,
                  decoration: TextDecoration.none,
                  fontSize: 20.0,
                  fontFamily: 'Roboto'),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 47.0, left: 150.0),
            child: Text(
              "     Finance",
              style: TextStyle(
                  color: Colors.white70,
                  decoration: TextDecoration.none,
                  fontSize: 20.0,
                  fontFamily: 'Roboto'),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: FloatingActionButton(
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.compare_arrows,
                  color: Colors.white70,
                ),
                onPressed: () {}),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: FloatingActionButton(
              backgroundColor: Colors.black,
              child: Icon(
                Icons.more_vert,
                color: Colors.white70,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0, bottom: 100.0),
            child: Text(
              '$result',
              style: TextStyle(
                  color: Colors.white, fontSize: 60.0, fontFamily: 'Roboto'),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 40.0),
          child: Center(
            child: Container(
              height: 0.3,
              width: 350.0,
              color: Colors.white24,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 400.0, left: 0.0),
          child: Row(children: <Widget>[
            MaterialButton(
              child: Text(
                'AC',
                style: TextStyle(
                    color: Colors.orange,
                    backgroundColor: Colors.black,
                    fontSize: 25.0,
                    fontFamily: 'Roboto'),
              ),
              onPressed: () {
                calculate("AC");
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left:10.0),
              child: MaterialButton(
                child: Text(
                  '\u232b',
                  style: TextStyle(
                      color: Colors.orange,
                      backgroundColor: Colors.black,
                      fontSize: 28.0),
                ),
                onPressed: (){
                  calculate("cut");
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:10.0),
              child: MaterialButton(
                child: Text(
                  '%',
                  style: TextStyle(
                      color: Colors.orange,
                      backgroundColor: Colors.black,
                      fontSize: 35.0),
                ),
                onPressed: (){
                  calculate("percent");
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:10.0),
              child: MaterialButton(
                child: Text(
                  '\u00F7',
                  style: TextStyle(
                      color: Colors.orange,
                      backgroundColor: Colors.black,
                      fontSize: 48.0),
                ),
                onPressed: (){
                  calculate("\u00F7");
                },
              ),
            )
          ]),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 480.0, left: 0.0),
          child: Row(children: <Widget>[
            MaterialButton(
              child: Text(
                '7',
                style: TextStyle(
                    color: Colors.white,
                    backgroundColor: Colors.black,
                    fontSize: 35.0,
                    fontFamily: 'Roboto'),
              ),
              onPressed: () {
                calculate("7");
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left:10.0),
              child: MaterialButton(
                child: Text(
                  '8',
                  style: TextStyle(
                      color: Colors.white,
                      backgroundColor: Colors.black,
                      fontSize: 35.0),
                ),
                onPressed: (){
                  calculate("8");
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:10.0),
              child: MaterialButton(
                child: Text(
                  '9',
                  style: TextStyle(
                      color: Colors.white,
                      backgroundColor: Colors.black,
                      fontSize: 35.0),
                ),
                onPressed: (){
                  calculate("9");
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:10.0),
              child: MaterialButton(
                child: Text(
                  '\u00d7',
                  style: TextStyle(
                      color: Colors.orange,
                      backgroundColor: Colors.black,
                      fontSize: 48.0),
                ),
                onPressed: (){
                  calculate("*");
                },
              ),
            )
          ]),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 560.0, left: 0.0),
          child: Row(children: <Widget>[
            MaterialButton(
              child: Text(
                '4',
                style: TextStyle(
                    color: Colors.white,
                    backgroundColor: Colors.black,
                    fontSize: 35.0,
                    fontFamily: 'Roboto'),
              ),
              onPressed: () {
                calculate("4");
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left:10.0),
              child: MaterialButton(
                child: Text(
                  '5',
                  style: TextStyle(
                      color: Colors.white,
                      backgroundColor: Colors.black,
                      fontSize: 35.0),
                ),
                onPressed: (){
                  calculate("5");
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:10.0),
              child: MaterialButton(
                child: Text(
                  '6',
                  style: TextStyle(
                      color: Colors.white,
                      backgroundColor: Colors.black,
                      fontSize: 35.0),
                ),
                onPressed: (){
                  calculate("6");
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:10.0),
              child: MaterialButton(
                child: Text(
                  '-',
                  style: TextStyle(
                      color: Colors.orange,
                      backgroundColor: Colors.black,
                      fontSize: 48.0),
                ),
                onPressed: (){
                  calculate("-");
                },
              ),
            )
          ]),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 640.0, left: 0.0),
          child: Row(children: <Widget>[
            MaterialButton(
              child: Text(
                '1',
                style: TextStyle(
                    color: Colors.white,
                    backgroundColor: Colors.black,
                    fontSize: 35.0,
                    fontFamily: 'Roboto'),
              ),
              onPressed: () {
                calculate("1");
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left:10.0),
              child: MaterialButton(
                child: Text(
                  '2',
                  style: TextStyle(
                      color: Colors.white,
                      backgroundColor: Colors.black,
                      fontSize: 35.0),
                ),
                onPressed: (){
                  calculate("2");
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:10.0),
              child: MaterialButton(
                child: Text(
                  '3',
                  style: TextStyle(
                      color: Colors.white,
                      backgroundColor: Colors.black,
                      fontSize: 35.0),
                ),
                onPressed: (){
                  calculate("3");
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:10.0),
              child: MaterialButton(
                child: Text(
                  '+',
                  style: TextStyle(
                      color: Colors.orange,
                      backgroundColor: Colors.black,
                      fontSize: 48.0),
                ),
                onPressed: (){
                  calculate("+");
                },
              ),
            )
          ]),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 730.0, left: 0.0),
          child: Row(children: <Widget>[
            MaterialButton(
              child: Container(
                height: 52.0,
                width: 45.0,
                child: FittedBox(
                  child: FloatingActionButton(
                      backgroundColor: Colors.black,
                      child: Icon(Icons.crop_rotate,color: Colors.orange,)
                  ),
                ),
              ),
              onPressed: () {
                print("hi");
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left:10.0),
              child: MaterialButton(
                child: Text(
                  '0',
                  style: TextStyle(
                      color: Colors.white,
                      backgroundColor: Colors.black,
                      fontSize: 35.0),
                ),
                onPressed: (){
                  calculate("0");
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:10.0),
              child: MaterialButton(
                child: Text(
                  '.',
                  style: TextStyle(
                      color: Colors.white,
                      backgroundColor: Colors.black,
                      fontSize: 35.0),
                ),
                onPressed: (){
                  calculate(".");
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:10.0),
              child: MaterialButton(
                child: Text(
                  '=',
                  style: TextStyle(
                      color: Colors.orange,
                      backgroundColor: Colors.black,
                      fontSize: 48.0),
                ),
                onPressed: (){
                  calculate("=");
                },
              ),
            )
          ]),
        ),
            /*Padding(
              padding: const EdgeInsets.only(top:730.0,left:38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 45.0,left: 0.0),
                    child: Container(
                      height: 52.0,
                      width: 45.0,
                      child: FittedBox(
                        child: FloatingActionButton(
                            backgroundColor: Colors.black,
                          child: Icon(Icons.crop_rotate,color: Colors.orange,)
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:25.0),
                    child: button('0'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:90.0),
                    child: button('.'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:90.0),
                    child: button2('='),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(right: 320.0,top:200.0,left: 20.0),
                child: FlatButton(
                  color: Colors.transparent,
                  onPressed: (){
                    calculate("7");
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(right: 190.0,top:200.0,left:130.0),
                child: FlatButton(
                  color: Colors.transparent,
                  onPressed: (){
                    calculate("8");
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(right: 90.0,top:200.0,left:240.0),
                child: FlatButton(
                  padding: EdgeInsets.only(left:45.0),
                  color: Colors.transparent,
                  onPressed: (){
                    calculate("9");
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(right: 90.0,top:360.0,left:240.0),
                child: FlatButton(
                  padding: EdgeInsets.only(left:45.0),
                  color: Colors.transparent,
                  onPressed: (){
                    calculate("6");
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(right: 190.0,top:360.0,left:130.0),
                child: FlatButton(
                  color: Colors.transparent,
                  onPressed: (){
                    calculate("5");
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(right: 320.0,top:360.0,left: 20.0),
                child: FlatButton(
                  color: Colors.transparent,
                  onPressed: (){
                    calculate("4");
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(right: 320.0,top:520.0,left: 20.0),
                child: FlatButton(
                  color: Colors.transparent,
                  onPressed: (){
                    calculate("1");
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(right: 190.0,top:520.0,left:130.0),
                child: FlatButton(
                  color: Colors.transparent,
                  onPressed: (){
                    calculate("2");
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(right: 190.0,top:700.0,left:130.0),
                child: FlatButton(
                  color: Colors.transparent,
                  onPressed: (){
                    calculate("0");
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(right: 90.0,top:530.0,left:240.0),
                child: FlatButton(
                  padding: EdgeInsets.only(left:45.0),
                  color: Colors.transparent,
                  onPressed: (){
                    calculate("3");
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(right: 90.0,top:700.0,left:240.0),
                child: FlatButton(
                  padding: EdgeInsets.only(left:45.0),
                  color: Colors.transparent,
                  onPressed: (){
                    calculate(".");
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(right: 320.0,top:50.0,left: 20.0),
                child: FlatButton(
                  color: Colors.transparent,
                  onPressed: (){
                    calculate("AC");
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(right: 190.0,top:50.0,left:130.0),
                child: FlatButton(
                  color: Colors.transparent,
                  onPressed: (){
                    calculate("cut");
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(right: 0.0,top:50.0,left:330.0),
                child: FlatButton(
                  color: Colors.transparent,
                  onPressed: (){
                    calculate("/");
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(right: 0.0,top:700.0,left:330.0),
                child: FlatButton(
                  color: Colors.transparent,
                  onPressed: (){
                    calculate("=");
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(right: 0.0,top:550.0,left:330.0),
                child: FlatButton(
                  color: Colors.transparent,
                  onPressed: (){
                    calculate("+");
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(right: 0.0,top:350.0,left:330.0),
                child: FlatButton(
                  color: Colors.transparent,
                  onPressed: (){
                    calculate("-");
                  },
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(right: 0.0,top:200.0,left:330.0),
                child: FlatButton(
                  color: Colors.transparent,
                  onPressed: (){
                    calculate("*");
                  },
                ),
              ),
            ),*/
      ]),
    );
  }

  Widget button(String text) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white, backgroundColor: Colors.black, fontSize: 35.0),
      ),
    );
  }

  Widget button2(String text) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
            color: Colors.orange,
            backgroundColor: Colors.black,
            fontSize: 35.0),
      ),
    );
  }
}
