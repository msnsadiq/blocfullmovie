import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:finalblocmovie/ApiItem/apiitem.dart';
import 'package:finalblocmovie/Model%20Classes/TvShowModel.dart';
import 'package:meta/meta.dart';

part 'bloc_tv_shows_event.dart';
part 'bloc_tv_shows_state.dart';

class TvShowsBloc extends Bloc<TvShowsEvent, TvShowsState> {
  ApiItem apiItem;
 late TvShowModel tvShowModel;
  TvShowsBloc(this.apiItem) : super(TvShowsInitial()) {
    on<TvShowsEvent>((event, emit) async{
      emit(TvShowsLoading());
      try{
        tvShowModel = await apiItem.getTvShows();
        emit(TvShowsLoaded());
      }
      catch(e){
        print("error $e ");
        emit(TvShowsError());

      }
      // TODO: implement event handler
    });
  }
}
