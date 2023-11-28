import 'package:dio/dio.dart';

import './constants.dart';

Dio _createDio() {
  var dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      baseUrl: BASE_URL,
    ),
  );

  return dio;
}

final dio = _createDio();
