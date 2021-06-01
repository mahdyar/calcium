import 'package:flutter/material.dart';
import 'package:calcium/pages/MainPage.dart';
import 'package:calcium/constants.dart';

/*
 * 
 * 
 * Developed by: mahdyar.me
 * Contact: hi@mahdyar.me
 * Github: https://git.io/mahdyar-calcium
 * 
 * 
*/

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
          primarySwatch: Colors.teal),
      home: MainPage(title: 'Calcium'),
    );
  }
}
