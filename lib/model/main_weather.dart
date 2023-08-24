class MainWeather {
  final int? temp;
  final int? feelsLike;
  final int? tempMin;
  final int? tempMax;
  final int? pressure;
  final int? humidity;

  MainWeather({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
  });

  factory MainWeather.fromJson(dynamic json) {
    if (json == null) {
      return MainWeather();
    }

    return MainWeather(
      // (double.parse(controller.currentWeatherData.main!.temp!) - 273.15).round().toString()
      temp: (json['temp'] - 273.15 as double).roundToDouble().toInt(),
      feelsLike:
          (json['feels_like'] - 273.15 as double).roundToDouble().toInt(),
      tempMin: (json['temp_min'] - 273.15 as double).roundToDouble().toInt(),
      tempMax: (json['temp_max'] - 273.15 as double).roundToDouble().toInt(),
      pressure: json['pressure'],
      humidity: json['humidity'],
    );
  }
}
