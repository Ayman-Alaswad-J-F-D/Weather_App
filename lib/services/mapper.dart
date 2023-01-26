import 'package:weather_app/app/extensions.dart';
import 'package:weather_app/app/constants.dart';
import 'package:weather_app/model/weather_model.dart';

extension WeatherModelMapper on WeatherModel? {
  WeatherModel toDomain() {
    return WeatherModel(
      name: this?.name.orEmpty() ?? Constants.empty,
      country: this?.country.orEmpty() ?? Constants.empty,
      data: this?.data.orEmpty() ?? Constants.empty,
      temp: this?.temp.orZeroDouble() ?? Constants.zeroDouble,
      maxTemp: this?.maxTemp.orZeroDouble() ?? Constants.zeroDouble,
      minTemp: this?.minTemp.orZeroDouble() ?? Constants.zeroDouble,
      weatherStateName: this?.weatherStateName.orEmpty() ?? Constants.empty,
      icon: this?.icon.orEmpty() ?? Constants.empty,
    );
  }
}
