import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:finalblocmovie/ApiItem/apiitem.dart';
import 'package:finalblocmovie/Model%20Classes/MovieDetailModel.dart';
import 'package:finalblocmovie/repository/api_client.dart';
import 'package:meta/meta.dart';

part 'details_movie_event.dart';
part 'details_movie_state.dart';

class DetailsMovieBloc extends Bloc<DetailsMovieEvent, DetailsMovieState> {
  ApiItem apiItem;
  late MovieDetailModel movieDetailModel;
  DetailsMovieBloc(this.apiItem) : super(DetailsMovieInitial()) {
    on<FetchingDetailMovie>((event, emit) async{
      emit(DetailsMovieLoading());
      try{
        movieDetailModel = await apiItem.getDetailMovie(id: event.id);
        emit(DetailsMovieLoaded());
      }
      catch(e){
        emit(DetailsMovieError());
      }
      // TODO: implement event handler
    });
  }
}
