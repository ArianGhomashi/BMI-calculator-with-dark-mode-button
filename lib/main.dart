import 'package:bmi_calculator_app/constants/constants.dart';
import 'package:bmi_calculator_app/screeens/first_screen.dart';
import 'package:bmi_calculator_app/screeens/result_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Application());
}

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
    );
  }
}
