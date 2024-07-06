import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:we_movies/core/constants/constants.dart';
import 'package:we_movies/core/helpers/helpers.dart';

Future<void> serviceBootup() async {
  await loadConfig();
  Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3/',
    ),
  ).interceptors.add(apiKeyInterceptor);
}

Future<void> loadConfig() async {
  await dotenv.load();
  AppConfig.apiKey = dotenv.env['API_KEY'] ?? AppConfig.apiKey;
}
