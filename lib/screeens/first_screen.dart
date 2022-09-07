import 'package:bmi_calculator_app/screeens/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator_app/constants/constants.dart';
import 'package:flutter/widgets.dart';

class FirstScreen extends StatefulWidget {
  FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  double result = 0;
  bool isLight = true;

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
              value: isLight,
              onChanged: (state) {
                setState(() {
                  isLight = state;
                });
              }),
        ],
        leading: IconButton(
          icon: Icon(Icons.trip_origin),
          onPressed: () {},
          iconSize: 40,
          color: _getTextThemeColor(),
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
            _getWeightTextfield(),
            SizedBox(
              height: 56,
            ),
            _getHeightTextfield(),
            SizedBox(
              height: 56,
            ),
            _getCalculateButton(context),
          ],
        ),
      ),
    );
  }

  Widget _getCalculateButton(BuildContext context) {
    return InkWell(
      onTap: () {
        if (weightController.text == '' || heightController.text == '') {
          return;
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ResultScreen(result: result, isLight: isLight),
            ),
          );
          _getResult();
        }
      },
      child: Container(
        width: 300,
        height: 72,
        decoration: BoxDecoration(
          color: _getTextThemeColor(),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              blurRadius: 4,
              offset: Offset(4, 4),
            ),
            BoxShadow(
              color: Color.fromRGBO(255, 255, 255, 0.25),
              blurRadius: 1,
              offset: Offset(-1, -1),
            ),
          ],
        ),
        child: Center(
          child: Text(
            'Calculate BMI',
            style: TextStyle(
              color: _getThemeColor(),
              fontSize: 20,
              fontFamily: 'WSL',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _getHeightTextfield() {
    return Container(
      width: 300,
      height: 128,
      decoration: BoxDecoration(
        color: _getThemeColor(),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            blurRadius: 4,
            offset: Offset(4, 4),
          ),
          BoxShadow(
            color: Color.fromRGBO(255, 255, 255, 0.25),
            blurRadius: 1,
            offset: Offset(-1, -1),
          ),
        ],
      ),
      child: Center(
        child: TextField(
          controller: heightController,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'RL',
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: _getTextThemeColor()),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'Height (m)',
            hintStyle: TextStyle(
              color: isLight
                  ? blackColor.withOpacity(0.8)
                  : whiteColor.withOpacity(0.5),
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget _getWeightTextfield() {
    return Container(
      width: 300,
      height: 128,
      decoration: BoxDecoration(
        color: _getThemeColor(),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            blurRadius: 4,
            offset: Offset(4, 4),
          ),
          BoxShadow(
            color: Color.fromRGBO(255, 255, 255, 0.25),
            blurRadius: 1,
            offset: Offset(-1, -1),
          ),
        ],
      ),
      child: Center(
        child: TextField(
          controller: weightController,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'RL',
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: _getTextThemeColor()),
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'Weight (kg)',
            hintStyle: TextStyle(
              color: isLight
                  ? blackColor.withOpacity(0.8)
                  : whiteColor.withOpacity(0.5),
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  void _getResult() {
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text);
    double BMI = weight / (height * height);
    result = BMI;
  }

  Color _getThemeColor() {
    if (isLight)
      return whiteColor;
    else
      return blackColor;
  }

  Color _getTextThemeColor() {
    if (isLight)
      return blackColor;
    else
      return whiteColor;
  }
}
