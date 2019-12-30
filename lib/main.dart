import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
    )
  );
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  var result = "0";
  var b0,b1,b2,b3,b4,b5,b6,b7,b8,b9,b10;
  var i = 0;
  String result1 = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operator = "";

  void calculate (String pressed) {

    if(pressed == "AC"){
      num1 = 0.0;
      num2 = 0.0;
      operator = "";
      result1 = "0";
    }
    else if(pressed == "+" || pressed == "-" || pressed == "/" || pressed == "*"){
      if(i==1){
        num2 = double.parse(result);
        if(operator == "+"){
          result1 = (num1+num2).toString();
        }
        if(operator == "-"){
          result1 = (num1-num2).toString();
        }
        if(operator == "/"){
          result1 = (num1/num2).toString();
        }
        if(operator == "*"){
          result1 = (num1*num2).toString();
        }
        setState(() {
          result = double.parse(result1).toStringAsFixed(2);
        });
        num1 = 0.0;
        num2 = 0.0;
        operator = "";
        i=0;
      }
      num1 = double.parse(result);
      operator = pressed;
      result1 = "0";
      i=1;
    }
    else if(pressed == "."){
      if(result1.contains(".")){}
      else {
        result1 = result1+pressed;
      }
    }
    else if(pressed == "="){
      num2 = double.parse(result);
      if(operator == "+"){
        result1 = (num1+num2).toString();
      }
      if(operator == "-"){
        result1 = (num1-num2).toString();
      }
      if(operator == "/"){
        result1 = (num1/num2).toString();
      }
      if(operator == "*"){
        result1 = (num1*num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operator = "";
      i=0;
      }
    else if(pressed == "cut"){
      var lengthString = result1.length-1;
      if(lengthString == 0){
        result1 = '0';
        print(lengthString);
      }
      else{
        result1 = result1.substring(0,lengthString);
      }
    }
    else {
      result1 = result1 +pressed;

    }

    setState(() {
      result = double.parse(result1).toStringAsFixed(2);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: <Widget>[
            Align(
              child: Scaffold(
                appBar: AppBar(
                  title: Padding(
                    padding: const EdgeInsets.only(left:50.0),
                    child: Text(
                      "    Calculator", style: TextStyle(color: Colors.orange),),
                  ),
                ),
                backgroundColor: Colors.black,
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top:47),
                child: Text("     Life",
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
                padding: const EdgeInsets.only(top: 47.0,left: 150.0),
                child: Text("     Finance",
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
                padding: const EdgeInsets.only(top:28.0),
                child: FloatingActionButton(
                    backgroundColor: Colors.black,
                    child: Icon(Icons.compare_arrows,color: Colors.white70,),
                    onPressed: () {

                    }
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: FloatingActionButton(
                  backgroundColor: Colors.black,
                  child: Icon(Icons.more_vert,color: Colors.white70,),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0, bottom: 100.0),
                child: Text('$result',style: TextStyle(color: Colors.white,fontSize: 60.0,fontFamily: 'Roboto'),),
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
              padding: const EdgeInsets.only(top:400.0,left:40.0),
              child: Row(
                children: <Widget>[
                  Container(
                      child: Text('AC',style: TextStyle(color: Colors.orange,
                          backgroundColor: Colors.black,
                          fontSize: 28.0,
                          fontFamily: 'Roboto'),),),
                  Padding(
                    padding: const EdgeInsets.only(left:70.0),
                    child: button2('\u232b'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:85.0),
                    child: button2('%'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:75.0),
                    child: button2('\u00F7'),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:480.0,left:43.0),
              child: Row(
                children: <Widget>[
                  button('7'),
                  Padding(
                    padding: const EdgeInsets.only(left:90.0),
                    child: button('8'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:90.0),
                    child: button('9'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom:6.0,left:85.0),
                    child: button2('\u00d7'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:560.0,left:43.0),
              child: Row(
                children: <Widget>[
                  button('4'),
                  Padding(
                    padding: const EdgeInsets.only(left:90.0),
                    child: button('5'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:90.0),
                    child: button('6'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom:8.0,left:90.0),
                    child: button2('-'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:650.0,left:43.0),
              child: Row(
                children: <Widget>[
                  button('1'),
                  Padding(
                    padding: const EdgeInsets.only(left:90.0),
                    child: button('2'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:90.0),
                    child: button('3'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom:4.0,left:85.0),
                    child: button2('+'),
                  ),
                ],
              ),
            ),
            Padding(
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
            ),
          ]
      ),
    );
  }

  Widget button (String text) {

    return Container(
      child: Text(text,style: TextStyle(color: Colors.white,backgroundColor: Colors.black,fontSize: 35.0),),
    );
  }

  Widget button2 (String text) {

    return Container(
      child: Text(text,style: TextStyle(color: Colors.orange,backgroundColor: Colors.black,fontSize: 35.0),),
    );
  }

}

