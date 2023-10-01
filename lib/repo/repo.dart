

import 'package:transform_event/model/gaming_name.dart';
import 'package:transform_event/service/api_service.dart';

class ApiRepository{

  final ApiService apiService = ApiService();

  Future<List<GamingName>> getFreeGame()=>apiService.getAllFreeGame();
}