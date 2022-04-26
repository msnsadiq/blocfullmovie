import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:finalblocmovie/ApiItem/apiitem.dart';
import 'package:finalblocmovie/Model%20Classes/SrarchAll.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  ApiItem apiItem;
 late SrarchAll searchall;
  SearchBloc(this.apiItem) : super(SearchInitial()) {
    on<FetchSearch>((event, emit) async{
      emit(SearchLoading());
      try{
        searchall = await apiItem.getSearchItem(query: event.query);
        emit(SearchLoaded());
      }
      catch(e){
        emit(SearchError());
       // print('error $e');
      }
      // TODO: implement event handler
    });
  }
}
