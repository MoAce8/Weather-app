import 'package:dio/dio.dart';
import 'package:weaher/screens/home/data/weather_model.dart';

class WeatherServices {
  final Dio dio;
  final baseUrl = 'http://api.weatherapi.com/v1';
  final apiKey = 'a1d9c588edbf4903898211106232412';

  WeatherServices({required this.dio});

  Future<WeatherModel> getCurrentWeather({required String city}) async {
    try {
      Response response =
          await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$city');

      WeatherModel model = WeatherModel.fromJson(response.data);
      return model;
    } on DioException catch (e) {
      final String errMessage = e.response?.data['error']['message'] ??
          'there was an error, try again later!';
      throw Exception(errMessage);
    } catch(e){
      throw Exception('there was an error, try again later!');
    }
  }
}
