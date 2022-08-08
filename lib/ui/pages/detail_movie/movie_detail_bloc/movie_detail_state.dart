part of 'movie_detail_bloc.dart';

@immutable

abstract class DetailMovieState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MovieDetailInitialState extends DetailMovieState {

}

class LoadingState extends DetailMovieState {}

class LoadedState extends DetailMovieState {
  // final CollectionResponse? collectionResponse;
  // LoadedState({this.collectionResponse});
  // @override
  // List<Object?> get props => [collectionResponse];
}
