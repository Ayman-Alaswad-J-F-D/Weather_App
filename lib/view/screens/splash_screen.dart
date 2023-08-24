import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../app/constants.dart';
import '../../utils/utils_home_screen/custom_text.dart';
import 'main_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splashIconSize: double.infinity,
      splash: const BodySplashScreen(),
      nextScreen: const MainScreen(),
      backgroundColor: kPrimaryColor.withOpacity(.8),
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
      children: [
        const Spacer(flex: 7),
        const CustomText(
          lable: "Current Weather",
          colorText: kWhite,
          fontSize: 25,
        ),
        const Spacer(),
        LottieBuilder.asset(
          Images.cloudyMain,
          height: MediaQuery.of(context).size.height / 1.5,
        ),
        const Spacer(flex: 4),
      ],
    );
  }
}
