import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/home_controller.dart';

import '../../app/constants.dart';

class CustomTextField extends GetView<HomeController> {
  CustomTextField({Key? key}) : super(key: key);

  final fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 60.0),
      child: Form(
        key: fromKey,
        child: TextFormField(
          onChanged: (value) => controller.city = value,
          onFieldSubmitted: (value) {
            if (fromKey.currentState!.validate()) {
              controller.checkerInternet(
                context: context,
                function: () => controller.updateWeather(context),
              );
            }
          },
          validator: (String? value) {
            if (value!.isEmpty) return "*Please Enter City Name";
            return null;
          },
          style: const TextStyle(color: kWhite),
          textInputAction: TextInputAction.search,
          decoration: const InputDecoration(
            hintText: 'SEARCH',
            hintStyle: TextStyle(color: kWhite),
            suffix: Icon(Icons.search, color: kWhite),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: kWhite),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: kWhite),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: kWhite),
            ),
          ),
        ),
      ),
    );
  }
}
