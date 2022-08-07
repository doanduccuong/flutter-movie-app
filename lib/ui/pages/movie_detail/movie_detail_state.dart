part of 'movie_detail_cubit.dart';

abstract class MovieDetailState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MovieDetailInitialState extends MovieDetailState {

}

class LoadingState extends MovieDetailState {}

class LoadedState extends MovieDetailState {}
