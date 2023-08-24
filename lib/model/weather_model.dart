class WeatherModel {
  String city;
  String country;
  double temp;
  String maxTemp;
  String minTemp;
  String weatherState;
  String desc;
  String data;
  String? icon;
  String lastUpdated;
  String? windSpeed;

  WeatherModel({
    required this.city,
    required this.country,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherState,
    required this.desc,
    this.windSpeed,
    this.data = "",
    this.icon,
    this.lastUpdated = "",
  });

  factory WeatherModel.fromJson(Map<String, dynamic> data) {
    var jsonData = data['main'];
    return WeatherModel(
      city: data['name'],
      country: data['sys']['country'],
      temp: jsonData['temp'],
      minTemp: jsonData['temp_min'].toString().substring(0, 2),
      maxTemp: jsonData['temp_max'].toString().substring(0, 2),
      weatherState: data['weather'][0]['main'],
      desc: data['weather'][0]['description'],
      windSpeed: data['wind']['speed'].toString(),
      // lastUpdated: data['current']['last_updated'],
      // icon: jsonData['condition']['icon'],
    );
  }
}
