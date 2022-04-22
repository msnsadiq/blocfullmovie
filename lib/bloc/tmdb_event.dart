part of 'tmdb_bloc.dart';

@immutable
abstract class TmdbEvent {}
class FetchingTrendingMovie extends TmdbEvent{}