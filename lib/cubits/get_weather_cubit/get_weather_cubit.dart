import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weaher/screens/home/data/weather_model.dart';
import 'package:weaher/services/weather_services.dart';

part 'get_weather_state.dart';

class GetWeatherCubit extends Cubit<GetWeatherState> {
  GetWeatherCubit() : super(GetWeatherInitial());

  static GetWeatherCubit get(context) => BlocProvider.of<GetWeatherCubit>(context);

  getWeather({required String cityName}) async {
    try {
      WeatherModel weather =
          await WeatherServices(dio: Dio()).getCurrentWeather(city: cityName);
      log(weather.cityName);
      emit(LoadingWeather());
      Future.delayed(
        const Duration(milliseconds: 1500),
        () {
          emit(WeatherLoaded(model: weather));
        },
      );
    } on Exception catch (e) {
      emit(WeatherError());
    }
  }
}
