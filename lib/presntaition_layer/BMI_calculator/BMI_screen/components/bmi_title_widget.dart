import 'package:bmi/constants/app_fonts.dart';
import 'package:bmi/constants/gaps.dart';
import 'package:flutter/material.dart';

class BMITitleWidget extends StatelessWidget {
  const BMITitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Gap(hRatio: 0.06),
        Text(
          "BMI calculator",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontFamily: FontFamily.mainFont,
          ),
        ),
        Divider(),
      ],
    );
  }
}
