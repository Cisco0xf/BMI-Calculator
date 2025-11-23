import 'package:bmi/commons/app_dimensions.dart';
import 'package:bmi/commons/commons.dart';
import 'package:bmi/constants/app_colors.dart';
import 'package:bmi/constants/app_fonts.dart';
import 'package:bmi/constants/assets.dart';
import 'package:bmi/constants/gaps.dart';
import 'package:bmi/statemanagement/BMI_calculator/calculate_bmi_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class GetWeightAgeDataWidget extends StatelessWidget {
  const GetWeightAgeDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BMIProvider>(
      builder: (context, bmi, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            WeightAgeWidget(
              controller: bmi.weightController!,
              hintText: "Enter Weight",
              imagePath: Assets.weight,
              title: "Weight(kg)",
            ),
            WeightAgeWidget(
              controller: bmi.ageController!,
              hintText: "Enter Age",
              imagePath: Assets.age,
              title: "Age",
              isAge: true,
            ),
          ],
        );
      },
    );
  }
}

class WeightAgeWidget extends StatefulWidget {
  const WeightAgeWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.imagePath,
    required this.title,
    this.isAge = false,
  });

  final String imagePath;
  final String title;
  final String hintText;
  final TextEditingController controller;
  final bool isAge;

  @override
  State<WeightAgeWidget> createState() => _WeightAgeWidgetState();
}

class _WeightAgeWidgetState extends State<WeightAgeWidget> {
  static const List<String> _unwanted = [
    "-",
    ",",
    ".",
    " ",
  ];

  void _removeUnWantedChar() {
    for (int i = 0; i < _unwanted.length; i++) {
      widget.controller.text =
          widget.controller.text.replaceAll(_unwanted[i], "");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding(10.0),
      margin: padding(10.0),
      decoration: BoxDecoration(
        borderRadius: borderRadius(15.0),
        color: ColorsSwitcher.mainColor,
        boxShadow: mainBoxShadow(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: context.screenWidth * .1,
                height: context.screenHeight * .04,
                child: SvgPicture.asset(widget.imagePath),
              ),
              if (widget.isAge) const Gap(wRatio: 0.02),
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  fontFamily: FontFamily.mainFont,
                ),
              ),
            ],
          ),
          SizedBox(
            height: context.screenHeight * .09,
            width: context.screenWidth * .35,
            child: TextFormField(
              controller: widget.controller,
              /* showCursor: true,
                  readOnly: true, */
              onChanged: (_) {
                _removeUnWantedChar();
              },
              inputFormatters: <TextInputFormatter>[
                LengthLimitingTextInputFormatter(3),
              ],
              keyboardType: TextInputType.number,
              cursorHeight: 27,
              style: const TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
                fontFamily: FontFamily.mainFont,
              ),
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: const TextStyle(
                  fontSize: 15,
                  fontFamily: FontFamily.mainFont,
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
