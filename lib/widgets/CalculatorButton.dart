import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorButton extends StatelessWidget {
  CalculatorButton(
      {required this.label,
      this.textColor = 0xFFFFFFFF,
      this.fillColor = 0x00ffffff,
      this.textSize = 28,
      required this.callback});
  final String label;
  final int textColor;
  final int fillColor;
  final double textSize;
  final Function callback;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: SizedBox(
          width: 65,
          height: 65,
          child: TextButton(
            onPressed: () {
              callback(label);
            },
            child: Text(label,
                style:
                    GoogleFonts.rubik(textStyle: TextStyle(fontSize: textSize))),
            style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.fromLTRB(15, 5, 15, 5)),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(fillColor)),
                foregroundColor:
                    MaterialStateProperty.all<Color>(Color(textColor)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ))),
          )),
    );
  }
}
