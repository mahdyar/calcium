import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorButton extends StatelessWidget {
  CalculatorButton(
      {required this.label,
      this.textColor = 0xFFFFFFFF,
      this.fillColor = 0x00ffffff,
      this.textSize = 24});
  final String label;
  final int textColor;
  final int fillColor;
  final double textSize;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 65,
        height: 65,
        child: TextButton(
          onPressed: () {},
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
        ));
  }
}
