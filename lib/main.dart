import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'utils/binding/home_binding.dart';
import 'view/screens/splash_screen.dart';

void main() => runApp(const WeatherApp());

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Lora'),
      initialRoute: '/',
      initialBinding: HomeBinding(),
      getPages: [
        GetPage(
          name: '/',
          page: () => const SplashScreen(),
        ),
      ],
    );
  }
}
