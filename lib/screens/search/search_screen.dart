import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weaher/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weaher/screens/home/data/weather_model.dart';
import 'package:weaher/services/weather_services.dart';
import 'package:weaher/shared/constants.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({Key? key}) : super(key: key);
  
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),

      ),
      body: Container(
        padding: EdgeInsets.all(screenWidth(context)*0.1),
        child: Center(
          child: TextField(
            controller: controller,
            decoration:InputDecoration(
              label: const Text('City Name'),
              hintText: 'Enter City',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16)
              )
            ),
            onSubmitted: (value) async {
              GetWeatherCubit.get(context).getWeather(cityName: value);
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
