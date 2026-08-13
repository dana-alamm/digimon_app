import 'package:dio/dio.dart';
import 'package:flutter_application_12/api/dio_handler.dart';
import 'package:flutter_application_12/model/digimon_model.dart';
import 'package:get_it/get_it.dart';

class ApiService {
  final Dio _dio = getIt<DioHandler>().dio;

  Future<List<DigimonModel>> getDigimons() async {
    try {
      final response = await _dio.get('/digimon');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => DigimonModel.fromJson(json)).toList();
      }
      return [];
    } catch (e) {
      if (e is DioException) {
        print('Error occurred:${e.message}');
      }
      rethrow;
    }
  }
}
