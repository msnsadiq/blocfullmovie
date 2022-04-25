part of 'search_bloc.dart';

@immutable
abstract class SearchEvent {}
class FetchSearch extends SearchEvent{
  String query;
  FetchSearch(this.query);
}