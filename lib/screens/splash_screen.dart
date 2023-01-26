import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/screens/search_screen.dart';

import '../app/constants.dart';
import '../utils/utils_home_screen/custom_text.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: double.infinity,
      splash: const BodySplashScreen(),
      nextScreen: const SearchScreen(),
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: kPrimaryColor,
    );
  }
}

class BodySplashScreen extends StatelessWidget {
  const BodySplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Spacer(flex: 3),
        CustomText(lable: "Current Weather", fontSize: 25),
        Spacer(flex: 1),
        Icon(Icons.sunny_snowing, color: kWhite, size: 100),
        Spacer(flex: 5),
      ],
    );
  }
}
