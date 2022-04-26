part of 'bloc_tv_shows_bloc.dart';

@immutable
abstract class TvShowsState {}

class TvShowsInitial extends TvShowsState {}
class TvShowsLoading extends TvShowsState{}
class TvShowsLoaded extends TvShowsState{}
class TvShowsError extends TvShowsState{}
