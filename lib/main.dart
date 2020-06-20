import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Calculator();
  }
}

class Calculator extends State<MyApp> {
  String text = '0';
  int numOne = 0;
 int numTwo = 0;

  String result = '0';
  String finalResult = '0';

  String opr = '';
  String preOpr = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              height: 350,
              width: double.infinity,
              padding: EdgeInsets.only(top: 270),
              child: Text(
                finalResult,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50.0,
                ),
                textAlign: TextAlign.right,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                createButton('C', Color(0xffa5a5a5), Colors.black),
                createButton('+/-', Color(0xffa5a5a5), Colors.black),
                createButton('%', Color(0xffa5a5a5), Colors.black),
                createButton('/', Color(0xffef9328), Colors.white),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                createButton('7', Color(0xff333333), Colors.white),
                createButton('8', Color(0xff333333), Colors.white),
                createButton('9', Color(0xff333333), Colors.white),
                createButton('x', Color(0xffef9328), Colors.white),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                createButton('4', Color(0xff333333), Colors.white),
                createButton('5', Color(0xff333333), Colors.white),
                createButton('6', Color(0xff333333), Colors.white),
                createButton('-', Color(0xffef9328), Colors.white),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                createButton('1', Color(0xff333333), Colors.white),
                createButton('2', Color(0xff333333), Colors.white),
                createButton('3', Color(0xff333333), Colors.white),
                createButton('+', Color(0xffef9328), Colors.white),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                createButton('0', Color(0xff333333), Colors.white, true),
                createButton(',', Color(0xff333333), Colors.white),
                createButton('=', Color(0xffef9328), Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }

  createButton(String textButton, Color buttonColor, Color textButtonColor,
      [bool zeroButton]) {
    switch (zeroButton) {
      case true:
        return RaisedButton(
          padding: EdgeInsets.only(
            left: 35,
            top: 20,
            right: 127,
            bottom: 20,
          ),
          onPressed: () {
            _calculate(textButton);
          },
          child: Text(
            textButton.toUpperCase(),
            style: TextStyle(
              color: textButtonColor,
              fontSize: 30,
            ),
          ),
          color: buttonColor,
          shape: StadiumBorder(),
        );
        break;
      default:
        return RaisedButton(
          padding: EdgeInsets.all(25),
          onPressed: () {
            _calculate(textButton);
          },
          child: Text(
            textButton.toUpperCase(),
            style: TextStyle(
              color: textButtonColor,
              fontSize: 30,
            ),
          ),
          color: buttonColor,
          shape: CircleBorder(),
        );
        break;
    }
  }

  _calculate(txtBtn) {
    if (txtBtn == 'C') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    } else if (txtBtn == '+' || txtBtn == '-' ||txtBtn == 'x') {


      switch(txtBtn){

        case '+':
          numOne = numOne+ int.parse(result);
          finalResult=numOne.toString();
        break;
        case '-':
          numOne =  int.parse(result);
          finalResult=numOne.toString();
          break;
        case 'x':
          numOne = int.parse(result);
          finalResult=numOne.toString();
          break;

      }
      opr = txtBtn;
      result = '';
    } else if (txtBtn == '=') {

      numTwo = int.parse(result);

      switch (opr) {
        case '+':
          finalResult = add();
          break;
        case '-':
        finalResult = sub();
        break;
        case 'x':
          finalResult =mul();
          break;
      }
    } else {
      if (result == '0'){
        result = '';}
      result = result + txtBtn;
      finalResult = result;

    }

    setState(() {

      text = finalResult;


    });
  }

  String add() {
    result = (numOne + numTwo).toString();

    numOne = int.parse(result);
    numOne=0;
    numTwo=0;
    return result;
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = int.parse(result);
    numOne=0;
    numTwo=0;
    return result;
  }
  String mul() {
    result = (numOne * numTwo).toString();
    numOne = int.parse(result);
    numOne=0;
    numTwo=0;
    return result;
  }
}

//Color(0xffa5a5a5)
