import 'package:bmi/commons/navigation_key.dart';
import 'package:bmi/presntaition_layer/splash_screen/splash_screen.dart';
import 'package:bmi/statemanagement/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

void main() {
  runApp(const BMIRoot());

  SystemChrome.setPreferredOrientations(
    <DeviceOrientation>[
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ],
  );
}

class BMIRoot extends StatelessWidget {
  const BMIRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: ToastificationWrapper(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
          navigatorKey: navigatorKey,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
          ),
        ),
      ),
    );
  }
}
