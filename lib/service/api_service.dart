import 'package:optout_ui/models/status_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: 'http://localhost:8080/api/v1')
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET('/status')
  Future<StatusModel> getStatus();
}
