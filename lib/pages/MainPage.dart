import 'package:calcium/constants.dart';
import 'package:calcium/modules/ReplaceHumanReadableChars.dart';
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
    if (number != '.' || !doesDecimalExist())
      setState(() {
        _expression += number;
      });
  }

  bool doesDecimalExist() {
    return _expression.contains('.');
  }

  void onAllClearClick(String ac) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void onClearClick(String c) {
    setState(() {
      _expression = '';
    });
  }

  void onBackSpaceClick() {
    if (_expression != '' && _expression.length > 0) {
      setState(() {
        _expression = _expression.substring(0, _expression.length - 1);
      });
    }
  }

  void calculate(String equal) {
    /*
     * Replaces all human readable characters to
     * computer readable characters, e.g: × -> *
    */

    String input = replaceHumanReadableChars(_expression);

    /* 
     * Using math_expressions package: https://pub.dev/packages/math_expressions
     * It takes an expression and returns the calculated value.
    */

    Parser parser = Parser();
    Expression expression = parser.parse(input);
    ContextModel contextModel = ContextModel();
    double calculated = expression.evaluate(EvaluationType.REAL, contextModel);

    // Removes all the trailing zeros since it's of type of double.
    String result =
        calculated.toString().replaceAll(RegExp(r"([.]*0)(?!.*\d)"), "");

    setState(() {
      _history = _expression;
      _expression = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        Container(
          padding: EdgeInsets.only(right: 12),
          child: Text(
            _history,
            style: GoogleFonts.rubik(
                textStyle: TextStyle(fontSize: 24), color: kHistoryColor),
          ),
          alignment: Alignment(1, 1),
        ),
        Container(
          padding: EdgeInsets.all(12),
          child: Text(
            _expression,
            style: GoogleFonts.rubik(
                textStyle: TextStyle(fontSize: 48), color: kWhite),
          ),
          alignment: kExpressionAligment,
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(width: 15),
            CalculatorButton(
                label: 'AC',
                fillColor: kClearButtonsColor,
                textSize: 22,
                callback: onAllClearClick),
            SizedBox(width: 15),
            CalculatorButton(
              label: 'C',
              fillColor: kClearButtonsColor,
              callback: onClearClick,
            ),
          ],
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CalculatorButton(
                label: '%',
                fillColor: kOperationButtonsColor,
                textColor: kOperationButtonTextColor,
                callback: onNumberClick,
              ),
              CalculatorButton(
                label: '/',
                fillColor: kOperationButtonsColor,
                textColor: kOperationButtonTextColor,
                callback: onNumberClick,
              ),
              CalculatorButton(
                label: '√',
                fillColor: kOperationButtonsColor,
                textColor: kOperationButtonTextColor,
                callback: onNumberClick,
              ),
              MaterialButton(
                // Backspace Button

                onPressed: onBackSpaceClick,
                color: kWhite,
                textColor: Color(kOperationButtonTextColor),
                child: Icon(
                  Icons.backspace_rounded,
                  size: 20,
                ),
                padding: EdgeInsets.all(20),
                shape: CircleBorder(),
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
                fillColor: kOperationButtonsColor,
                textColor: kOperationButtonTextColor,
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
                fillColor: kOperationButtonsColor,
                textColor: kOperationButtonTextColor,
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
                fillColor: kOperationButtonsColor,
                textColor: kOperationButtonTextColor,
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
                textSize: 22,
                callback: onNumberClick,
              ),
              CalculatorButton(
                label: '=',
                fillColor: kOperationButtonsColor,
                textColor: kOperationButtonTextColor,
                callback: calculate,
              ),
            ]),
      ]),
    );
  }
}
