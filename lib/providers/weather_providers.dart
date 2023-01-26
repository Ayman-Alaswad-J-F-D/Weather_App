import 'package:flutter/cupertino.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  WeatherModel? _weatherModel;
  set weatherData(WeatherModel? weather) {
    _weatherModel = weather;
    notifyListeners();
  }

  WeatherModel? get weatherData => _weatherModel;

  bool getImage() {
    var dataTime = _weatherModel!.data.substring(11);

    if (dataTime.startsWith("7") ||
        dataTime.startsWith("8") ||
        dataTime.startsWith("9") ||
        dataTime.startsWith("10") ||
        dataTime.startsWith("11") ||
        dataTime.startsWith("12") ||
        dataTime.startsWith("13") ||
        dataTime.startsWith("14") ||
        dataTime.startsWith("15") ||
        dataTime.startsWith("16")) {
      return true;
    } else {
      return false;
    }
  }

  String getTime() {
    var dataTime = _weatherModel!.data.substring(11);

    if (dataTime.startsWith('13') ||
        dataTime.startsWith('14') ||
        dataTime.startsWith('15') ||
        dataTime.startsWith('16') ||
        dataTime.startsWith('17') ||
        dataTime.startsWith('18') ||
        dataTime.startsWith('19') ||
        dataTime.startsWith('20') ||
        dataTime.startsWith('21') ||
        dataTime.startsWith('22') ||
        dataTime.startsWith('23') ||
        dataTime.startsWith('24')) {
      return "PM";
    } else {
      return "AM";
    }
  }
}

// ! not used .. This Comments for get location user
  // LocationData? locationData;
  // Future<void> getLocationUser() async {
  //   Location location = Location();
  //   bool _serviceEnabled;
  //   PermissionStatus _permissionGranted;
  //   _serviceEnabled = await location.serviceEnabled();
  //   if (!_serviceEnabled) {
  //     _serviceEnabled = await location.requestService();
  //     if (!_serviceEnabled) {
  //       return;
  //     }
  //   }
  //   _permissionGranted = await location.hasPermission();
  //   if (_permissionGranted == PermissionStatus.denied) {
  //     _permissionGranted = await location.requestPermission();
  //     if (_permissionGranted != PermissionStatus.granted) {
  //       return;
  //     }
  //   }
  //   locationData = await location.getLocation();
  //   print(locationData?.latitude);
  //   print(locationData?.longitude);
  // }
  // Future<void> getCountry() async {
  //   List<Placemark> placekmarkUser = await placemarkFromCoordinates(
  //     provider.locationData?.latitude ?? 0,
  //     provider.locationData?.longitude ?? 0,
  //     localeIdentifier: "en",
  //   );
  //   print(placekmarkUser[0].country);
  //   print(placekmarkUser[0].street);
  // }
  // // late double latitudeUser = locationData?.latitude ?? 0;
  // // late double longitudeUser = locationData?.latitude ?? 0;

