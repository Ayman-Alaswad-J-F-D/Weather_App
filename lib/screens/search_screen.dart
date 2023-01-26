import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

import '../app/constants.dart';
import '../model/weather_model.dart';
import '../providers/weather_providers.dart';
import '../services/weather_service.dart';
import '../utils/utils_home_screen/custom_glassmorphic_container.dart';
import '../utils/utils_search_screen/custom_snack_bar.dart';
import '../utils/utils_search_screen/custom_text_form_field.dart';
import 'home_screen.dart';

// ignore: must_be_immutable
class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  static const String routeName = 'SearchScreen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();

  bool progressIndicator = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: progressIndicator,
      color: kWhite,
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
          ),
          title: const Text("Weather Status Current"),
          backgroundColor: kPrimaryColor,
          centerTitle: true,
          elevation: 2.5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ),
        body: Container(
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(25),
            boxShadow: const [
              BoxShadow(color: Colors.black54, blurRadius: 2.5),
            ],
          ),
          child: CustomGlassmorphicContainer(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                const Spacer(),
                const Text(
                  'Please Search for a City First',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CustomTextFormField(
                      onSubmitted: (data) async {
                        try {
                          setState(() {
                            progressIndicator = true;
                          });

                          await searchLocation(data, context).then(
                            (value) => setState(() {
                              progressIndicator = value;
                            }),
                          );
                        } catch (e) {
                          setState(() {
                            progressIndicator = false;
                          });

                          ScaffoldMessenger.of(context).showSnackBar(
                            CustomSnackBar(
                              "No matching location found, Please Try Again",
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
                const Spacer(flex: 4),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> searchLocation(String data, BuildContext context) async {
    final InternetConnectionChecker _internetConnectionChecker =
        InternetConnectionChecker();

    if (formKey.currentState!.validate()) {
      if (await _internetConnectionChecker.hasConnection) {
        WeatherService service = WeatherService();
        WeatherModel weatherModel = await service.getWeather(cityName: data);
        Provider.of<WeatherProvider>(context, listen: false).weatherData =
            weatherModel;
        Navigator.pushNamed(context, HomeScreen.routeName);

        return false;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          CustomSnackBar("Check your connection in internet ..."),
        );

        return false;
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        CustomSnackBar("Please Enter City Name"),
      );

      return false;
    }
  }
}
