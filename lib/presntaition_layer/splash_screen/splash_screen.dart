import 'package:bmi/commons/app_dimensions.dart';
import 'package:bmi/commons/navigation_key.dart';
import 'package:bmi/constants/app_fonts.dart';
import 'package:bmi/constants/assets.dart';
import 'package:bmi/constants/gaps.dart';
import 'package:bmi/presntaition_layer/BMI_calculator/BMI_screen/bmi_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _pushToMainScreen() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.of(navigatorKey.currentContext!).pushReplacement(
          MaterialPageRoute(builder: (context) => const BMIMainScreen()),
        );
      },
    );
  }

  @override
  void initState() {
    _pushToMainScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE0F4FF),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: context.screenHeight * .3,
            ),
            SizedBox(
              width: context.screenWidth * .8,
              height: context.screenHeight * .3,
              child: Image.asset(Assets.logo, fit: BoxFit.contain),
            ),
            const Text(
              "BMI",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: FontFamily.mainFont,
                fontSize: 30,
              ),
            ),
            const Gap(hRatio: 0.05),
          ],
        ),
      ),
    );
  }
}
