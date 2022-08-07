import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_base/network/model/collection_response.dart';
import 'package:flutter_base/repositories/movie_repository.dart';
import 'package:meta/meta.dart';

part 'movie_detail_event.dart';

part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  MovieRepository movieRepo;
  String collectionId;

  MovieDetailBloc({required this.movieRepo, required this.collectionId})
      : super(MovieDetailInitialState()) {
    on<MovieDetailLoadingEvent>((event, emit) {
      emit(LoadingState());
      on<MovieDetailLoadingEvent>((event, emit) {
        movieRepo.getCollectionData(collectionId: collectionId);
      });
    });
    on<MovieDetailLoadedEvent>((event, emit) {
      emit(LoadedState());
    });
  }
}
