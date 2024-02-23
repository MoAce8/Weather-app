import 'package:flutter/material.dart';
import 'package:weaher/screens/home/data/weather_model.dart';

import '../../shared/constants.dart';

class WeatherHome extends StatelessWidget {
  const WeatherHome({super.key, required this.weatherModel,});

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: screenWidth(context) * 0.1),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            weatherModel.cityName,
            style: TextStyle(
              fontSize: screenWidth(context) * 0.07,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
            style: TextStyle(
              fontSize: screenWidth(context) * 0.045,
            ),
          ),
          SizedBox(
            height: screenHeight(context) * 0.065,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/clear.png'),
              Text(
                weatherModel.temp.round().toString(),
                style: TextStyle(
                  fontSize: screenWidth(context) * 0.07,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  Text(
                    'maxTemp: ${weatherModel.maxTemp.round()}',
                    style: TextStyle(
                      fontSize: screenWidth(context) * 0.04,
                    ),
                  ),
                  Text(
                    'minTemp: ${weatherModel.minTemp.round()}',
                    style: TextStyle(
                      fontSize: screenWidth(context) * 0.04,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: screenHeight(context) * 0.065,
          ),
          Text(
            weatherModel.condition,
            style: TextStyle(
              fontSize: screenWidth(context) * 0.07,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
