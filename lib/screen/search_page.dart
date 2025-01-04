import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/cubits/wether_cubit/weather_cubit.dart';

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
            onSubmitted: (
              value,
            ) async {
              cityName = value;

              BlocProvider.of<WeatherCubit>(context)
                  .getWeather(cityName: cityName!);
              BlocProvider.of<WeatherCubit>(context).cityName = cityName;
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
                
              BlocProvider.of<WeatherCubit>(context)
                  .getWeather(cityName: cityName!);
              BlocProvider.of<WeatherCubit>(context).cityName = cityName;
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
