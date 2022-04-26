part of 'tv_detail_bloc.dart';

@immutable
abstract class TvDetailEvent {}
class FetchTvDetail extends TvDetailEvent{
  String id;
  FetchTvDetail({required this.id});
}