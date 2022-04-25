part of 'details_movie_bloc.dart';

@immutable
abstract class DetailsMovieState {}

class DetailsMovieInitial extends DetailsMovieState {}

class DetailsMovieLoaded extends DetailsMovieState {}
class DetailsMovieLoading extends DetailsMovieState{}
class DetailsMovieError extends DetailsMovieState{}
