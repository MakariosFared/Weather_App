import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:my_weather_app/models/weather_model.dart';
import 'package:my_weather_app/services/weather_service.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 12,
          // backgroundColor: Colors.blue,
          title: const Text(
            'Search city',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              // color: Colors.white,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: TextField(
              onSubmitted: (value) async {
               var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
               getWeatherCubit.getWeather(cityName: value);
                Navigator.pop(context);
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                labelText: 'Search',
                suffixIcon: Icon(Icons.search),
                hintText: 'Enter city name',
              ),
            ),
          ),
        ));
  }
}

