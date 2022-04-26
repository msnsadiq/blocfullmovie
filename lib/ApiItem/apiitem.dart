import 'dart:convert';

import 'package:finalblocmovie/Model%20Classes/MovieDetailModel.dart';
import 'package:finalblocmovie/Model%20Classes/SrarchAll.dart';
import 'package:finalblocmovie/Model%20Classes/TrendingMovieModel.dart';
import 'package:finalblocmovie/Model%20Classes/TvDetailModel.dart';
import 'package:finalblocmovie/Model%20Classes/TvShowModel.dart';
import 'package:finalblocmovie/repository/api_client.dart';
import 'package:http/http.dart';

class ApiItem{
  ApiClient apiClient = ApiClient();
  String basePath = 'trending/all/day';
  String pathMovieDetail = 'movie/';
  String pathsearchmoviedeatail = '&query=';
  String pathtvshows = 'tv/top_rated';
  String pathtvdetails = 'tv/';

  Future<TrendingMovieModel>getTrendingMovie()async{
    Response response = await apiClient.invokeAPI(path: basePath, method: 'GET', body: null);
    return TrendingMovieModel.fromJson(json.decode(response.body));
  }
  Future<MovieDetailModel>getDetailMovie({required String id})async{
    Response response = await apiClient.invokeAPI(path: pathMovieDetail+id, method: 'GET', body: null);
    return MovieDetailModel.fromJson(json.decode(response.body));
  }
  Future<SrarchAll>getSearchItem({required String query})async{
    Response response = await apiClient.invokeAPI(path: pathsearchmoviedeatail+query, method: 'SEARCH', body: null);
    print(json.decode(response.body));
    return SrarchAll.fromJson(json.decode(response.body));

  }

  Future<TvShowModel>getTvShows()async{
    Response response = await apiClient.invokeAPI(path: pathtvshows, method: 'GET', body: null);
    return TvShowModel.fromJson(json.decode(response.body));

  }
  
  Future<TvDetailModel>getTvDetail({required String id})async{
    Response response = await apiClient.invokeAPI(path: pathtvdetails+id, method: 'GET', body: null);
    print(json.decode(response.body));
    return TvDetailModel.fromJson(json.decode(response.body));
  }
}