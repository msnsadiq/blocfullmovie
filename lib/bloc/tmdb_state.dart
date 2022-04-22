part of 'tmdb_bloc.dart';

@immutable
abstract class TmdbState {}

class TmdbInitial extends TmdbState {}
class TmdbLoaded extends TmdbState{}
class TmdbLoading extends TmdbState{}
class TmdbError extends TmdbState{}
