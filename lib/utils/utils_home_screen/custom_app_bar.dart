import 'package:flutter/material.dart';

import '../../app/constants.dart';
import 'custom_text.dart';

// ! Not Use
class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: const [
                Icon(
                  Icons.location_city_rounded,
                  color: kWhite,
                  size: 30,
                ),
                SizedBox(width: 10),
                CustomText(
                  lable: 'Country Name',
                  fontSize: 18,
                  shadowTrue: true,
                ),
              ],
            ),
          ),
          CircleAvatar(
            radius: 16,
            backgroundColor: kWhite,
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                // Navigator.pushNamed(context, SearchScreen.routeName);
              },
              icon: const Icon(
                Icons.search,
                color: Colors.blueGrey,
                size: 22,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
