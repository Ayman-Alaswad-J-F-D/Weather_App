class WeatherModel {
  String name;
  String country;
  String data;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;
  String icon;

  WeatherModel({
    required this.name,
    required this.country,
    required this.data,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherStateName,
    required this.icon,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> data) {
    var jsonData = data['forecast']['forecastday'][0]['day'];
    return WeatherModel(
      name: data['location']['name'],
      country: data['location']['country'],
      data: data['location']['localtime'],
      temp: jsonData['avgtemp_c'],
      maxTemp: jsonData['maxtemp_c'],
      minTemp: jsonData['mintemp_c'],
      weatherStateName: jsonData['condition']['text'],
      icon: jsonData['condition']['icon'],
    );
  }
}
