import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/wether_cubit/wearther_state.dart';
import 'package:weather_app/model/wether_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherCubit extends Cubit<WeartherState> {
  WeatherCubit(this.weatherService) : super(WeatherInitial());
  WeatherService weatherService;
  WeatherModel? weatherModel;
  String? cityName;
  void getWeather({required String cityName}) async {
    emit(WeatherLoadig());
    try {
      weatherModel = await weatherService.getWeather(cityName: cityName);
      print(weatherModel);
      emit(WeatherSuccess());
    } on Exception catch (_) {
      emit(WeatherFailure());
    }
  }
}
