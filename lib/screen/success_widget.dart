import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app/cubits/wether_cubit/weather_cubit.dart';
import 'package:weather_app/model/wether_model.dart';

class SuccessWidget extends StatelessWidget {
  const SuccessWidget({
    super.key,
    required this.weatherData,
  });

  final WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          weatherData!.changeThemeColor(),
          weatherData!.changeThemeColor()[300]!,
          weatherData!.changeThemeColor()[100]!,
          // Colors.white,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 3,
            ),
            Text(
              BlocProvider.of<WeatherCubit>(context).cityName!,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              'updated at: ${weatherData!.date.hour}:${weatherData!.date.minute}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Lottie.asset(weatherData!.getLottie(), height: 100),
                Text(
                  weatherData!.temp.toString(),
                  style: const TextStyle(
                      fontSize: 26, fontWeight: FontWeight.bold),
                ),
                Column(
                  children: [
                    Text(
                      'maxtemp : ${weatherData!.maxTemp.toInt()}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'mintemp : ${weatherData!.minTemp.toInt()}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Text(
              weatherData!.weatherStateName,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const Spacer(
              flex: 5,
            ),
          ],
        ));
  }
}
