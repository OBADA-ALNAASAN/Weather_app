import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/provider/weather_provider.dart';
import 'package:weather_app/screen/home_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) {
        return WeatherProvider();
      },
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primarySwatch: Colors.yellow,
        appBarTheme: AppBarTheme(
          color: Provider.of<WeatherProvider>(context).weatherData == null
              ? Colors.blue
              : Provider.of<WeatherProvider>(context)
                  .weatherData!
                  .changeThemeColor(),
          // elevation: 1,
          
        ),
      ),
      home: const HomePage(),
    );
  }
}


  // static const String baseUrl = 'http://api.weatherapi.com/v1';

  // static const String apiKey = '42ca314a5e044285a1d95119232609';


  //   Uri url =
  //       Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
  //   http.Response response = await http.get(url);
 //http://api.weatherapi.com/v1/forecast.json?key=42ca314a5e044285a1d95119232609&q=damascus&days=7