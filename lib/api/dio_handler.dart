import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class DioHandler {
  final Dio dio;
  DioHandler._internal()
    : dio = Dio(
        BaseOptions(
          baseUrl: "https://digimon-api.vercel.app/api/",
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
        ),
      ) {
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,

        responseBody: true,
        error: true,
        compact: true,
      ),
    );
  }
  static void setup() {
    getIt.registerLazySingleton(() => DioHandler._internal());
  }
}
