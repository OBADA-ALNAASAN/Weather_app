import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/wether_cubit/weather_cubit.dart';
import 'package:weather_app/screen/home_page.dart';
import 'package:weather_app/services/weather_service.dart';

void main() {
  runApp(BlocProvider(
      create: (BuildContext context) {
        return WeatherCubit(WeatherService());
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
          
          color: BlocProvider.of<WeatherCubit>(context).weatherModel == null
              ? Colors.blue
              : BlocProvider.of<WeatherCubit>(context)
                  .weatherModel!
                  .changeThemeColor(),
                  
          elevation: 1,
          
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