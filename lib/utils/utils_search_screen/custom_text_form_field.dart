import 'package:flutter/material.dart';

import '../../app/constants.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.onSubmitted,
  }) : super(key: key);

  final Function(String) onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onSubmitted,
      validator: (data) {
        if (data!.isEmpty) {
          return '*required';
        }
        return null;
      },
      cursorColor: kWhite,
      cursorRadius: const Radius.circular(10),
      decoration: const InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kWhite),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kWhite),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        suffixIcon: Icon(Icons.search, color: kWhite),
        label: Text('Search'),
        labelStyle: TextStyle(color: kWhite),
        hintText: "Enter City Name",
        hintStyle: TextStyle(color: kWhite),
      ),
    );
  }
}
