import 'package:bmi_calculator_app/constants/constants.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen({Key? key, this.result = 0, this.isLight}) : super(key: key);
  double result;
  bool? isLight;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  bool? isLight;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLight = widget.isLight;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Switch(
              activeTrackColor: blackColor,
              activeColor: whiteColor,
              inactiveTrackColor: whiteColor,
              inactiveThumbColor: blackColor,
              value: isLight!,
              onChanged: (state) {
                setState(() {
                  isLight = state;
                });
              }),
        ],
        leading: IconButton(
          color: _getTextThemeColor(),
          icon: Icon(Icons.arrow_back_ios),
          iconSize: 40,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: _getThemeColor(),
        elevation: 7,
        shadowColor: Color.fromRGBO(0, 0, 0, 0.25),
      ),
      backgroundColor: _getThemeColor(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'BMI',
              style: TextStyle(
                color: _getTextThemeColor(),
                fontSize: 36,
                fontFamily: 'WSL',
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    offset: Offset(4, 4),
                    blurRadius: 4,
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                  ),
                ],
              ),
            ),
            Text(
              widget.result.toStringAsFixed(2),
              style: TextStyle(
                color: _getTextThemeColor(),
                fontSize: 124,
                fontFamily: 'RL',
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    offset: Offset(4, 4),
                    blurRadius: 4,
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                  ),
                ],
              ),
            ),
            Text(
              _getBMIRange(widget.result),
              style: TextStyle(
                color: _getTextThemeColor(),
                fontSize: 36,
                fontFamily: 'RL',
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    offset: Offset(4, 4),
                    blurRadius: 4,
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getBMIRange(double result) {
    String rangeResult = '';

    if (result < 18.5) rangeResult = 'UNDERWEIGHT';
    if (result >= 18.5 && result < 25) rangeResult = 'NORMAL';
    if (result >= 25 && result < 30) rangeResult = 'OVERWEIGHT';
    if (result >= 30) rangeResult = 'OBESE';

    return rangeResult;
  }

  Color _getThemeColor() {
    if (isLight!)
      return whiteColor;
    else
      return blackColor;
  }

  Color _getTextThemeColor() {
    if (isLight!)
      return blackColor;
    else
      return whiteColor;
  }
}
