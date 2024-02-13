import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:my_weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:my_weather_app/models/weather_model.dart';
import 'package:my_weather_app/views/search_view.dart';
import 'package:my_weather_app/widget/no_weather_body.dart';
import 'package:my_weather_app/widget/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const SearchView()));
            },
            icon: const Icon(
              Icons.search,
              color: Colors.white,
              size: 28,
            ),
          )
        ],
        title: const Text('Weather app',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              // color: Colors.white,
            )),
        // backgroundColor: Colors.blue,
        elevation: 12,
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const NoWeatherBody();
          } else if (state is WeatherLoadedState) {
            return  WeatherInfoBody(weather: state.weatherModel,
            );
          } else {
            return const Text('Oops there was an error');
          }
        },
      ),
    );
  }
}
