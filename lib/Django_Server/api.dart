import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const String baseUrl = "http://192.168.31.107:8000/";

class APi {
  final Dio requestManager = Dio();

  APi() {
    requestManager.options.baseUrl = baseUrl;
    requestManager.options.headers = {"Content-type": "application/json"};
    requestManager.interceptors.add(PrettyDioLogger(
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      request: true,
      error: true,
    ));
  }

  Dio get sendRequest => requestManager;
}

class ApiResponse {
  bool status;
  dynamic data;
  String? message;

  ApiResponse({
    required this.status,
    this.data,
    this.message,
  });

  factory ApiResponse.fromResponse(Response response) {
    if (response.statusCode == 200) {
      return ApiResponse(status: true, data: response.data);
    } else {
      return ApiResponse(
          status: false,
          message: "Request failed with status: ${response.statusCode}");
    }
  }
}
