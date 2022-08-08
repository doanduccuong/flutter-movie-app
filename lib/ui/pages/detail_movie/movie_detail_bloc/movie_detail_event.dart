part of 'movie_detail_bloc.dart';

@immutable
abstract class DetailMovieEvent {}

class MovieDetailInitialEvent extends DetailMovieEvent {}

class MovieDetailLoadingEvent extends DetailMovieEvent {}

class MovieDetailLoadedEvent extends DetailMovieEvent {}
