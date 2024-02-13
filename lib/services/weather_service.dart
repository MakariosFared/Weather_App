import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:my_weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = '9267faaa20d74571ae8163807232911';
  WeatherService(this.dio);
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1&aqi=no&alerts=no');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    } on DioException catch (e) {
      final String errMessage = e.response?.data['error']['message'] ??
          'Oops there was an error';
      throw Exception(errMessage);
    }
    catch (e){
      log(e.toString());
      throw Exception('Oops there was an error , try later');
    }
  }
}
