import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:my_weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:my_weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit , WeatherState>(
          builder: (BuildContext context, state) {
           return MaterialApp(
              theme: ThemeData(
                useMaterial3: false,
                primarySwatch: getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.weatherCondition,
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: const HomeView(),
            );
          },

        );
      }),
    );
  }

}
MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.lightBlue;
  }
  switch (condition) {
    case "Sunny":
      return Colors.orange;
    case "Partly cloudy":
      return Colors.blue;
    case "Cloudy":
      return Colors.grey;
    case "Overcast":
    case "Mist":
    case "Patchy rain possible":
    case "Patchy snow possible":
    case "Patchy sleet possible":
      return Colors.lightBlue;
    case "Thundery outbreaks possible":
      return Colors.deepPurple;
    case "Blowing snow":
      return Colors.blueGrey;
    case "Blizzard":
      return Colors.grey;
    case "Fog":
    case "Freezing fog":
      return Colors.grey;
    case "Patchy light drizzle":
    case "Light drizzle":
    case "Freezing drizzle":
    case "Heavy freezing drizzle":
    case "Patchy light rain":
    case "Light rain":
    case "Moderate rain at times":
    case "Moderate rain":
    case "Heavy rain at times":
    case "Heavy rain":
      return Colors.blue;
    case "Light freezing rain":
    case "Moderate or heavy freezing rain":
      return Colors.lightBlue;
    case "Light sleet":
    case "Moderate or heavy sleet":
      return Colors.cyan;
    case "Patchy light snow":
    case "Light snow":
    case "Patchy moderate snow":
    case "Moderate snow":
    case "Patchy heavy snow":
    case "Heavy snow":
      return Colors.blueGrey;
    case "Ice pellets":
      return Colors.blue;
    case "Light rain shower":
    case "Moderate or heavy rain shower":
    case "Torrential rain shower":
      return Colors.blue;
    case "Light sleet showers":
    case "Moderate or heavy sleet showers":
      return Colors.cyan;
    case "Light snow showers":
    case "Moderate or heavy snow showers":
      return Colors.blueGrey;
    case "Light showers of ice pellets":
    case "Moderate or heavy showers of ice pellets":
      return Colors.blue;
    case "Patchy light rain with thunder":
    case "Moderate or heavy rain with thunder":
      return Colors.deepPurple;
    case "Patchy light snow with thunder":
    case "Moderate or heavy snow with thunder":
      return Colors.blueGrey;
    default:
      return Colors.blue;
  }
}
