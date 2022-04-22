import 'dart:convert';

import 'package:finalblocmovie/Model%20Classes/TrendingMovieModel.dart';
import 'package:finalblocmovie/repository/api_client.dart';
import 'package:http/http.dart';

class ApiItem{
  ApiClient apiClient = ApiClient();
  String basePath = 'trending/all/day';
  Future<TrendingMovieModel>getTrendingMovie()async{
    Response response = await apiClient.invokeAPI(path: basePath, method: 'GET', body: null);
    return TrendingMovieModel.fromJson(json.decode(response.body));
  }
}