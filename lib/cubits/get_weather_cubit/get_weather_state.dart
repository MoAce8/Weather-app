part of 'get_weather_cubit.dart';

abstract class GetWeatherState {}

class GetWeatherInitial extends GetWeatherState {}

class LoadingWeather extends GetWeatherState {}

class WeatherLoaded extends GetWeatherState {
  final WeatherModel model;

  WeatherLoaded({required this.model});
}

class WeatherError extends GetWeatherState {}
