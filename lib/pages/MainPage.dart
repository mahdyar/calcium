import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:calcium/widgets/CalculatorButton.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String _history = '';
  String _expression = '';

  void onNumberClick(String number) {
    setState(() {
      _expression += number;
    });
  }

  void onAllClearClick(String ac) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void onClearClick(String c){
    setState(() {
      _expression = '';
    });
  }

  void calculate(String equal){
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    setState(() {
      _history = _expression;
      _expression = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text(widget.title),
      // ),
      backgroundColor: Color(0xFF283637),
      body: Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        Container(
          padding: EdgeInsets.only(right: 12),
          child: Text(
            _history,
            style: GoogleFonts.rubik(
                textStyle: TextStyle(fontSize: 24), color: Color(0xFF545F61)),
          ),
          alignment: Alignment(1, 1),
        ),
        Container(
          padding: EdgeInsets.all(12),
          child: Text(
            _expression,
            style: GoogleFonts.rubik(
                textStyle: TextStyle(fontSize: 48), color: Colors.white),
          ),
          alignment: Alignment(1, 1),
        ),
        SizedBox(height: 20),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CalculatorButton(
                label: 'AC',
                fillColor: 0xFF6C807F,
                textSize: 24,
                callback: onAllClearClick
              ),
              CalculatorButton(
                label: 'C',
                fillColor: 0xFF6C807F,
                callback: onClearClick,
              ),
              CalculatorButton(
                label: '%',
                fillColor: 0xFFFFFFFF,
                textColor: 0xFF65BDAC,
                callback: onNumberClick,
              ),
              CalculatorButton(
                label: '/',
                fillColor: 0xFFFFFFFF,
                textColor: 0xFF65BDAC,
                callback: onNumberClick,
              ),
            ]),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CalculatorButton(
                label: '7',
                callback: onNumberClick,
              ),
              CalculatorButton(
                label: '8',
                callback: onNumberClick,
              ),
              CalculatorButton(
                label: '9',
                callback: onNumberClick,
              ),
              CalculatorButton(
                label: '×',
                fillColor: 0xFFFFFFFF,
                textColor: 0xFF65BDAC,
                callback: onNumberClick,
              ),
            ]),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CalculatorButton(
                label: '4',
                callback: onNumberClick,
              ),
              CalculatorButton(
                label: '5',
                callback: onNumberClick,
              ),
              CalculatorButton(
                label: '6',
                callback: onNumberClick,
              ),
              CalculatorButton(
                label: '-',
                fillColor: 0xFFFFFFFF,
                textColor: 0xFF65BDAC,
                callback: onNumberClick,
              ),
            ]),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CalculatorButton(
                label: '1',
                callback: onNumberClick,
              ),
              CalculatorButton(
                label: '2',
                callback: onNumberClick,
              ),
              CalculatorButton(
                label: '3',
                callback: onNumberClick,
              ),
              CalculatorButton(
                label: '+',
                fillColor: 0xFFFFFFFF,
                textColor: 0xFF65BDAC,
                callback: onNumberClick,
              ),
            ]),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CalculatorButton(
                label: '.',
                callback: onNumberClick,
              ),
              CalculatorButton(
                label: '0',
                callback: onNumberClick,
              ),
              CalculatorButton(
                label: '00',
                textSize: 26,
                callback: onNumberClick,
              ),
              CalculatorButton(
                label: '=',
                fillColor: 0xFFFFFFFF,
                textColor: 0xFF65BDAC,
                callback: calculate,
              ),
            ]),
      ]),
    );
  }
}
