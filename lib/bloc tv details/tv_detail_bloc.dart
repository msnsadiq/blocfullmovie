import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:finalblocmovie/ApiItem/apiitem.dart';
import 'package:finalblocmovie/Model%20Classes/TvDetailModel.dart';
import 'package:meta/meta.dart';

part 'tv_detail_event.dart';
part 'tv_detail_state.dart';

class TvDetailBloc extends Bloc<TvDetailEvent, TvDetailState> {
  ApiItem apiItem;
  late TvDetailModel tvDetailModel;
  TvDetailBloc(this.apiItem) : super(TvDetailInitial()) {
    on<FetchTvDetail>((event, emit)async {
      emit(TvDetailLoading());
      try{
        tvDetailModel = await apiItem.getTvDetail(id: event.id);
        emit(TvDetailLoaded());
      }
      catch(e){
        emit(TvDetailError());
        print(e);
      }
      // TODO: implement event handler
    });
  }
}
