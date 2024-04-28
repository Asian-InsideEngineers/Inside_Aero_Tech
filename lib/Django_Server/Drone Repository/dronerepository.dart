import 'package:dio/dio.dart';
import 'package:insideflyingconcept/Django_Server/Models/dronemodel.dart';
import 'package:insideflyingconcept/Django_Server/api.dart';

class DroneRepository {
  final _api = APi();

  Future<List<DroneModel>> getallflightmodes() async {
    try {
      Response response = await _api.sendRequest.get("/PrimaryRequest");

      ApiResponse apiResponse = ApiResponse.fromResponse(response);

      if (!apiResponse.status) {
        throw apiResponse.message.toString();
      }
      return (apiResponse.data as List<dynamic>)
          .map((json) => DroneModel.fromJson(json))
          .toList();
    } catch (ex) {
      rethrow;
    }
  }
}
