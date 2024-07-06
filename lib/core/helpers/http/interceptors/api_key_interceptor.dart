import 'package:dio/dio.dart';
import 'package:we_movies/core/constants/constants.dart';

final InterceptorsWrapper apiKeyInterceptor = InterceptorsWrapper(
  onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters = options.queryParameters
      ..addAll(
        {
          'api_key': AppConfig.apiKey,
        },
      );
    return handler.next(options);
  },
  onResponse: (Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  },
  onError: (DioException error, ErrorInterceptorHandler handler) {
    return handler.next(error);
  },
);
