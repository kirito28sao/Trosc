import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<FetchWeather>((event, emit) async {
      try {
        WeatherFactory wf = WeatherFactory("ec74d9070c909672319eb43496254731",
            language: Language.ENGLISH);
        Weather weather = await wf.currentWeatherByLocation(
            event.position.latitude, event.position.longitude);
        emit(WeatherSuccess(weather));
      } catch (e) {
        emit(const WeatherFailure('Please try again.'));
      }
    });

    on<SearchWeather>((event, emit) async {
      emit(WeatherLoading());
      try {
        WeatherFactory wf = WeatherFactory('ec74d9070c909672319eb43496254731',
            language: Language.ENGLISH);
        Weather weather = await wf.currentWeatherByCityName(event.cityName);
        emit(WeatherSuccess(weather));
      } catch (e) {
        emit(const WeatherFailure(
            'City not found. Please enter a valid city name.'));
      }
    });
  }
}
