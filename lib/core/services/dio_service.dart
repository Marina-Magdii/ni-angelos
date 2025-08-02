import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:ni_angelos/core/utils/end_points.dart';

@singleton
class DioService {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: EndPoints.baseUrl,
      headers: {},
    ),
  );
  Future<Response> get(String path) async {
    return _dio.get(path);
  }

  Future<Response> post(String path, dynamic data) async {
    return _dio.post(path, data: data);
  }
  Dio get dio => _dio;
}