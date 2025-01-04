import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:weather_app/cubits/wether_cubit/wearther_state.dart';
import 'package:weather_app/cubits/wether_cubit/weather_cubit.dart';
import 'package:weather_app/model/wether_model.dart';

import 'package:weather_app/screen/search_page.dart';
import 'package:weather_app/screen/success_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
   
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return SearchPage();
                  },
                ));
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ],
          title: const Text(
            'Weather App',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: BlocBuilder<WeatherCubit, WeartherState>(
          builder: (context, state) {
            if (state is WeatherLoadig) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is WeatherSuccess) {
            WeatherModel  weatherData = BlocProvider.of<WeatherCubit>(context).weatherModel!;
              return SuccessWidget(weatherData: weatherData);
            } else if (state is WeatherFailure) {
              return const Text('something was wrong please try again');
            } else {
              return const DefaultBody();
            }
          },
        ),
      ),
    );
  }
}

class DefaultBody extends StatelessWidget {
  const DefaultBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
      Text(
        'there is no weather 😔 start',
        style: TextStyle(
          fontSize: 24,
        ),
      ),
      Text(
        'searching now 🔍',
        style: TextStyle(
          fontSize: 24,
        ),
      ),
    ]));
  }
}
