part of 'movie_detail_bloc.dart';

@immutable
abstract class MovieDetailEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class MovieDetailInitialEvent extends MovieDetailEvent {}

class MovieDetailLoadingEvent extends MovieDetailEvent {
  final CollectionResponse? collectionResponse;
  MovieDetailLoadingEvent({this.collectionResponse});
  @override
  List<Object?> get props => [collectionResponse];
}

class MovieDetailLoadedEvent extends MovieDetailEvent {
  final CollectionResponse? collectionResponse;
  MovieDetailLoadedEvent({this.collectionResponse});
  @override
  List<Object?> get props => [collectionResponse];
}
