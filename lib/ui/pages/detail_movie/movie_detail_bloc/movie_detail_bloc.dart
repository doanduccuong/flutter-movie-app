import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_base/network/model/collection_response.dart';
import 'package:flutter_base/repositories/movie_repository.dart';
import 'package:meta/meta.dart';

part 'movie_detail_event.dart';

part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {

  MovieDetailBloc()
      : super(LoadedState()) {
    on<MovieDetailEvent>((event, emit) {
      emit(LoadedState());

    });
    on<MovieDetailLoadedEvent>((event, emit) {
    });
  }
}
