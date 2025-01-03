import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/model/wether_model.dart';
import 'package:weather_app/provider/weather_provider.dart';

import 'package:weather_app/screen/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<WeatherProvider>(context).weatherData;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.blue,
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
        body: weatherData == null
            ? const Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
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
                    )
                  ],
                ),
              )
            : Container(
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
                      Provider.of<WeatherProvider>(context).cityName!,
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'updated at: ${weatherData!.date.hour}:${weatherData!.date.minute}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
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
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'mintemp : ${weatherData!.minTemp.toInt()}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      weatherData!.weatherStateName,
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const Spacer(
                      flex: 5,
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
