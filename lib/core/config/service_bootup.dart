import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:we_movies/core/constants/constants.dart';

Future<void> serviceBootup() async {
  await loadConfig();
}

Future<void> loadConfig() async {
  await dotenv.load();
  AppConfig.apiKey = dotenv.env['API_KEY'] ?? AppConfig.apiKey;
}
