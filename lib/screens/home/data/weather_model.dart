class WeatherModel {
  final String cityName;
  final DateTime date;
  final String? img;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String condition;

  WeatherModel({
    required this.cityName,
    required this.date,
    this.img,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.condition,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      temp: json['current']['temp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      condition: json['current']['condition']['text'],
      img: json['current']['condition']['icon'],
    );
  }
}
