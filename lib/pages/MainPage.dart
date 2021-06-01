import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:calcium/widgets/CalculatorButton.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
            '123*123',
            style: GoogleFonts.rubik(
                textStyle: TextStyle(fontSize: 24), color: Color(0xFF545F61)),
          ),
          alignment: Alignment(1, 1),
        ),
        Container(
          padding: EdgeInsets.all(12),
          child: Text(
            '123',
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
              ),
              CalculatorButton(
                label: 'C',
                fillColor: 0xFF6C807F,
              ),
              CalculatorButton(
                label: '%',
                fillColor: 0xFFFFFFFF,
                textColor: 0xFF65BDAC,
              ),
              CalculatorButton(
                label: '/',
                fillColor: 0xFFFFFFFF,
                textColor: 0xFF65BDAC,
              ),
            ]),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CalculatorButton(
                label: '7',
              ),
              CalculatorButton(
                label: '8',
              ),
              CalculatorButton(
                label: '9',
              ),
              CalculatorButton(
                label: '×',
                fillColor: 0xFFFFFFFF,
                textColor: 0xFF65BDAC,
              ),
            ]),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CalculatorButton(
                label: '4',
              ),
              CalculatorButton(
                label: '5',
              ),
              CalculatorButton(
                label: '6',
              ),
              CalculatorButton(
                label: '-',
                fillColor: 0xFFFFFFFF,
                textColor: 0xFF65BDAC,
              ),
            ]),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CalculatorButton(
                label: '1',
              ),
              CalculatorButton(
                label: '2',
              ),
              CalculatorButton(
                label: '3',
              ),
              CalculatorButton(
                label: '+',
                fillColor: 0xFFFFFFFF,
                textColor: 0xFF65BDAC,
              ),
            ]),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              CalculatorButton(
                label: '.',
              ),
              CalculatorButton(
                label: '0',
              ),
              CalculatorButton(
                label: '00',
                textSize: 26,
              ),
              CalculatorButton(
                label: '=',
                fillColor: 0xFFFFFFFF,
                textColor: 0xFF65BDAC,
              ),
            ]),
      ]),
    );
  }
}
