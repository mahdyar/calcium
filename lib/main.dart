import 'package:flutter/material.dart';
import 'package:calcium/pages/MainPage.dart';
import 'package:calcium/constants.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calcium',
      theme: ThemeData(
        primaryColor: kMainColor,
        scaffoldBackgroundColor: kMainColor,
        textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white)),
        fontFamily: 'IRANYekan',
      ),
      home: MainPage(title: 'Calcium'),
    );
  }
}


