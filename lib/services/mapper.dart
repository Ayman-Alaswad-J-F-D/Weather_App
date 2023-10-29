import 'package:weather_app/model/five_days_data.dart';

import '../app/constants.dart';
import '../app/extensions.dart';
import '../model/clouds.dart';
import '../model/coord.dart';
import '../model/current_weather_data.dart';
import '../model/main_weather.dart';
import '../model/sys.dart';
import '../model/weather.dart';
import '../model/wind.dart';

extension FiveDayDataMapper on FiveDayData? {
  FiveDayData toDomain() {
    return FiveDayData(
      temp: this?.temp.orZero() ?? Constants.zero,
      dateTime: this?.dateTime.orEmpty() ?? Constants.empty,
    );
  }
}

extension CurrentWeatherDataMapper on CurrentWeatherData? {
  CurrentWeatherData toDomain() {
    return CurrentWeatherData(
      id: this?.id.orZero() ?? Constants.zero,
      name: this?.name.orEmpty() ?? Constants.empty,
      base: this?.base.orEmpty() ?? Constants.empty,
      cod: this?.cod.orZero() ?? Constants.zero,
      dt: this?.dt.orZero() ?? Constants.zero,
      timezone: this?.timezone.orZero() ?? Constants.zero,
      visibility: this?.visibility.orZero() ?? Constants.zero,
      clouds: this?.clouds.toDomain(),
      coord: this?.coord.toDomain(),
      main: this?.main.toDomain(),
      sys: this?.sys.toDomain(),
      wind: this?.wind.toDomain(),
      weather: (this?.weather?.map((weatherData) => weatherData.toDomain()) ??
              const Iterable.empty())
          .cast<Weather>()
          .toList(),
    );
  }
}

extension CloudsMapper on Clouds? {
  Clouds toDomain() {
    return Clouds(all: this?.all.orZero() ?? Constants.zero);
  }
}

extension CoordMapper on Coord? {
  Coord toDomain() {
    return Coord(
      lat: this?.lat.orZeroDouble() ?? Constants.zeroDouble,
      lon: this?.lon.orZeroDouble() ?? Constants.zeroDouble,
    );
  }
}

extension MainWeatherMapper on MainWeather? {
  MainWeather toDomain() {
    return MainWeather(
      temp: this?.temp.orZero() ?? Constants.zero,
      tempMax: this?.tempMax.orZero() ?? Constants.zero,
      tempMin: this?.tempMin.orZero() ?? Constants.zero,
      feelsLike: this?.feelsLike.orZero() ?? Constants.zero,
      humidity: this?.humidity.orZero() ?? Constants.zero,
      pressure: this?.pressure.orZero() ?? Constants.zero,
    );
  }
}

extension SysMapper on Sys? {
  Sys toDomain() {
    return Sys(
      id: this?.id.orZero() ?? Constants.zero,
      country: this?.country.orEmpty() ?? Constants.empty,
      sunrise: this?.sunrise.orZero() ?? Constants.zero,
      sunset: this?.sunset.orZero() ?? Constants.zero,
      type: this?.type.orZero() ?? Constants.zero,
    );
  }
}

extension WindMapper on Wind? {
  Wind toDomain() {
    return Wind(
      deg: this?.deg.orZero() ?? Constants.zero,
      speed: this?.speed.orZeroDouble() ?? Constants.zeroDouble,
    );
  }
}

extension WeatherMapper on Weather? {
  Weather toDomain() {
    return Weather(
      id: this?.id.orZero() ?? Constants.zero,
      des: this?.des.orEmpty() ?? Constants.empty,
      icon: this?.icon.orEmpty() ?? Constants.empty,
      main: this?.main.orEmpty() ?? Constants.empty,
    );
  }
}
