import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
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
            WeatherDetail wee = snapshot.data!;
            return Center(
              child: Container(
                width: size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [Colors.cyan, Colors.white],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          top: size.height * 0.2, left: size.width * 0.1),
                      child: Text(
                        "Ha Noi, Viet Nam",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: size.height * 0.01, left: size.width * 0.1),
                      child: Text(
                        currenDate(),
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: size.height * 0.03, left: size.width * 0.37),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${wee.current!.temperature2m}",
                            style: TextStyle(
                                fontSize: 50, fontWeight: FontWeight.bold),
                          ),
                          Text("\u2103")
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: size.height * 0.07, left: size.width * 0.1),
                      width: size.width * 0.78,
                      height: size.height * 0.1,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.all(size.width * 0.05),
                            child: Row(
                              children: [
                                Icon(Icons.wind_power),
                                SizedBox(
                                  width: size.width * 0.02,
                                ),
                                Text("Wind")
                              ],
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.all(size.width * 0.05),
                              child: Text("${wee.current!.windSpeed10m}km/h"))
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: size.height * 0.01, left: size.width * 0.1),
                      width: size.width * 0.78,
                      height: size.height * 0.1,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.all(size.width * 0.05),
                            child: Row(
                              children: [
                                Icon(Icons.water),
                                SizedBox(
                                  width: size.width * 0.02,
                                ),
                                Text("Humidity")
                              ],
                            ),
                          ),
                          Container(
                              margin: EdgeInsets.all(size.width * 0.05),
                              child:
                                  Text("${wee.current!.relativeHumidity2m}%"))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
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

  String currenDate() {
    final now = DateTime.now();

    final dayOfWeek = DateFormat('E').format(now);

    final monthName = DateFormat('MMM').format(now);

    final currentDay = DateFormat('d').format(now);

    final formattedDate = '$dayOfWeek, $monthName $currentDay';
    return formattedDate;
  }
}
