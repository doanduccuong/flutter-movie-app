part of 'movie_detail_bloc.dart';

@immutable
abstract class MovieDetailEvent {}

class MovieDetailInitialEvent extends MovieDetailEvent {}

class MovieDetailLoadingEvent extends MovieDetailEvent {}

class MovieDetailLoadedEvent extends MovieDetailEvent {}
