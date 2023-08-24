import 'package:weather_app/app/extensions.dart';
import 'package:weather_app/app/constants.dart';
import 'package:weather_app/model/weather_model.dart';

extension WeatherModelMapper on WeatherModel? {
  WeatherModel toDomain() {
    return WeatherModel(
      city: this?.city.orEmpty() ?? Constants.empty,
      country: this?.country.orEmpty() ?? Constants.empty,
      data: this?.data.orEmpty() ?? Constants.empty,
      temp: this?.temp.orZeroDouble() ?? Constants.zeroDouble,
      maxTemp: this?.maxTemp.orEmpty() ?? Constants.empty,
      minTemp: this?.minTemp.orEmpty() ?? Constants.empty,
      weatherState: this?.weatherState.orEmpty() ?? Constants.empty,
      icon: this?.icon.orEmpty() ?? Constants.empty,
      lastUpdated: this?.lastUpdated.orEmpty() ?? Constants.empty,
      desc: this?.desc.orEmpty() ?? Constants.empty,
    );
  }
}
