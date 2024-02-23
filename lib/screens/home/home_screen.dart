import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weaher/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weaher/screens/home/data_home.dart';
import 'package:weaher/screens/home/no_data_home.dart';
import 'package:weaher/screens/search/search_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => SearchScreen(),
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, GetWeatherState>(
        builder: (context, state) {
          if(state is GetWeatherInitial){
            return NoCityHomeScreen();
          }else if(state is LoadingWeather){
            return LoadingScreen();
          }else if(state is WeatherLoaded){
            return WeatherHome(weatherModel: state.model,);
          }else{
            return Text('Sorry');
          }
        },
      ),
    );
  }
}

