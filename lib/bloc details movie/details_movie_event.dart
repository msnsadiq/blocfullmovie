part of 'details_movie_bloc.dart';

@immutable
abstract class DetailsMovieEvent {}
class FetchingDetailMovie extends DetailsMovieEvent{
String id;
FetchingDetailMovie({required this.id});
}