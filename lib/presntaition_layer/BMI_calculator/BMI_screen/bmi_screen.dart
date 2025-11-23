import 'package:bmi/commons/app_dimensions.dart';
import 'package:bmi/commons/commons.dart';
import 'package:bmi/constants/app_colors.dart';
import 'package:bmi/constants/app_fonts.dart';
import 'package:bmi/constants/gaps.dart';
import 'package:bmi/presntaition_layer/BMI_calculator/BMI_screen/components/bmi_title_widget.dart';
import 'package:bmi/presntaition_layer/BMI_calculator/BMI_screen/components/select_gender_widget.dart';
import 'package:bmi/presntaition_layer/BMI_calculator/BMI_screen/components/select_height_widget.dart';
import 'package:bmi/presntaition_layer/BMI_calculator/BMI_screen/components/weight_age_widget.dart';
import 'package:bmi/statemanagement/BMI_calculator/calculate_bmi_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BMIMainScreen extends StatefulWidget {
  const BMIMainScreen({super.key});

  @override
  State<BMIMainScreen> createState() => _BMIMainScreenState();
}

class _BMIMainScreenState extends State<BMIMainScreen> {
  late final BMIProvider bmi;

  @override
  void initState() {
    bmi = Provider.of<BMIProvider>(context, listen: false)..initControllers();

    super.initState();
  }

  @override
  void dispose() {
    bmi.diposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: const Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        body: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                BMITitleWidget(),
                Gap(height: 10),
                SelectGenderWidget(),
                SelectBMIHeightWidget(),
                GetWeightAgeDataWidget(),
              ],
            ),
            Expanded(child: SizedBox()),
            CalculateBMICustomButtonWidget(),
          ],
        ),
      ),
    );
  }
}

class CalculateBMICustomButtonWidget extends StatelessWidget {
  const CalculateBMICustomButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BMIProvider>(
      builder: (context, calculateBMI, _) {
        return Container(
          height: context.screenHeight * .21,
          decoration: BoxDecoration(
            borderRadius: borderRadius(55, side: Side.top),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                blurRadius: 5.0,
                spreadRadius: 0.1,
                color: Color(0xFFe0e0e0),
                blurStyle: BlurStyle.normal,
                offset: Offset(4, 4),
              ),
            ],
            color: ColorsSwitcher.mainColor,
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: borderRadius(55, side: Side.top),
              onTap: () => calculateBMI.calculteBMI(),
              child: Padding(
                padding: padding(20.0),
                child: const Column(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.red,
                      radius: 28,
                      child: Icon(Icons.arrow_forward),
                    ),
                    Gap(hRatio: 0.01),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "Calculate",
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: FontFamily.mainFont,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
