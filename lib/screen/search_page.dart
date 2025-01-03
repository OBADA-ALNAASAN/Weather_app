import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/model/wether_model.dart';
import 'package:weather_app/provider/weather_provider.dart';

import 'package:weather_app/services/weather_service.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  String? cityName;

  SearchPage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: const Text(
            'Search City',
          ),
        ),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (value) {
              cityName = value;
            },
            onSubmitted: (value,) async {
              cityName = value;
              WeatherService service = WeatherService();
              WeatherModel? weather =
                  await service.getWeather(cityName: cityName!);
              Provider.of<WeatherProvider>(context, listen: false).weatherData =
                  weather;
              Provider.of<WeatherProvider>(context, listen: false).cityName =
                  cityName;

              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              label: const Text('Search'),
              suffixIcon: IconButton(
                onPressed: () async {
                  WeatherService service = WeatherService();
                  WeatherModel? weather =
                      await service.getWeather(cityName: cityName!);
                  Provider.of<WeatherProvider>(context, listen: false)
                      .weatherData = weather;
                  Provider.of<WeatherProvider>(context, listen: false)
                      .cityName = cityName;

                  Navigator.pop(context);
                },
                icon: const Icon(Icons.search),
              ),
              hintText: 'Enter a city',
            ),
          ),
        )),
      ),
    );
  }
}
