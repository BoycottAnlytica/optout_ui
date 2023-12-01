import 'package:optout_ui/models/status_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:optout_ui/config/env.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: BASE_URL)
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET('/status')
  Future<StatusModel> getStatus();
}
