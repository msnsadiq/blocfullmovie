import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:finalblocmovie/ApiItem/apiitem.dart';
import 'package:finalblocmovie/Model%20Classes/TrendingMovieModel.dart';
import 'package:meta/meta.dart';

part 'tmdb_event.dart';
part 'tmdb_state.dart';

class TmdbBloc extends Bloc<TmdbEvent, TmdbState> {
  ApiItem apiItem;
 late TrendingMovieModel trendingMovieModel;
  TmdbBloc(this.apiItem) : super(TmdbInitial()) {
    on<TmdbEvent>((event, emit) async{
      emit(TmdbLoading());
      try{
        trendingMovieModel = await apiItem.getTrendingMovie();
        emit(TmdbLoaded());
      }
      catch(e){
        emit(TmdbError());
      }
      // TODO: implement event handler
    });
  }
}
