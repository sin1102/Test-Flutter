import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test/models/weather.dart';

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder(
        future: fetchWeather(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator(
              color: Colors.grey,
            ));
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Future<WeatherDetail> fetchWeather() async {
    WeatherDetail op = WeatherDetail();
    const url =
        'https://api.open-meteo.com/v1/forecast?latitude=21.035598&longitude=105.7724538&current=temperature_2m,relative_humidity_2m,wind_speed_10m&timezone=Asia%2FBangkok&forecast_days=1';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = response.body;
      final res = jsonDecode(body);
      op = WeatherDetail.fromJson(res);
      print('fetch completed');
    } else {
      print('unexpected res');
    }
    return op;
  }
}
