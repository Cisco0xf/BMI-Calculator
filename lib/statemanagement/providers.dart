import 'package:bmi/statemanagement/BMI_calculator/calculate_bmi_provider.dart';
import 'package:bmi/statemanagement/BMI_calculator/get_bmi_height_provider.dart';
import 'package:bmi/statemanagement/BMI_calculator/select_bim_gender.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> get providers {
  return [
    ChangeNotifierProvider(create: (context) => SelectBMIGenderProvider()),
    ChangeNotifierProvider(create: (context) => GetHeightProvider()),
    Provider(create: (context) => BMIProvider()),
  ];
}
