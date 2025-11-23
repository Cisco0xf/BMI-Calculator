import 'dart:developer';

import 'package:bmi/commons/navigation_key.dart';
import 'package:bmi/commons/show_toastification.dart';
import 'package:bmi/constants/texts.dart';
import 'package:bmi/presntaition_layer/BMI_calculator/BMI_details/bmi_details_screen.dart';
import 'package:bmi/statemanagement/BMI_calculator/get_bmi_height_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

class BMIProvider {
  final BuildContext context = navigatorKey.currentContext!;

  GetHeightProvider get userHeight => Provider.of<GetHeightProvider>(
        context,
        listen: false,
      );

  double userBMI = 0.0;

  TextEditingController? ageController;
  TextEditingController? weightController;

  void initControllers() {
    ageController = TextEditingController();
    weightController = TextEditingController();
  }

  void diposeControllers() {
    ageController?.dispose();
    weightController?.dispose();
  }

  bool get checkValidation =>
      ageController!.text.trim().isNotEmpty &&
      weightController!.text.trim().isNotEmpty;

  void calculteBMI() {
    if (!checkValidation) {
      showToastification(
        title: "Please insert valid value",
        type: ToastificationType.warning,
      );

      return;
    }

    final String weightText = weightController!.text;
    final String ageText = ageController!.text;

    double userWeight = double.parse(weightText);
    int userAge = int.parse(ageText);
    int height = userHeight.userHeight;

    if (userWeight == 0 || userAge == 0) {
      showToastification(title: aboveZ, type: ToastificationType.warning);
      return;
    }

    if (userWeight == 0 || userWeight > 250) {
      showToastification(title: validWeight, type: ToastificationType.warning);
      return;
    }

    if (userAge == 0 || userAge >= 130) {
      showToastification(title: validAge, type: ToastificationType.warning);
      return;
    }

    double heightM = height / 100;

    double calcultedBMI = userWeight / (heightM * heightM);

    String bmiRounded = calcultedBMI.toStringAsFixed(2);

    userBMI = double.parse(bmiRounded);

    if (userBMI <= 12) {
      showToastification(title: tooLow, type: ToastificationType.warning);
      return;
    }

    if (userBMI >= 60) {
      showToastification(title: tooHigh, type: ToastificationType.warning);
      return;
    }

    Navigator.of(navigatorKey.currentContext!).push(
      MaterialPageRoute(
        builder: (context) {
          return BMIDetailsScreen(
            age: ageText,
            weight: weightText,
            userBmi: userBMI,
          );
        },
      ),
    );

    log("User BMI : $userBMI");
  }
}
