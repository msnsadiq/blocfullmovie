part of 'tv_detail_bloc.dart';

@immutable
abstract class TvDetailState {}

class TvDetailInitial extends TvDetailState {}
class TvDetailLoading extends TvDetailState{}
class TvDetailLoaded extends TvDetailState{}
class TvDetailError extends TvDetailState{}