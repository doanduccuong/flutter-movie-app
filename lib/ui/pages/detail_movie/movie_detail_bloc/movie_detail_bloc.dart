import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_base/network/model/collection_response.dart';
import 'package:flutter_base/repositories/movie_repository.dart';
import 'package:meta/meta.dart';

part 'movie_detail_event.dart';

part 'movie_detail_state.dart';

class DetailMovieBloc extends Bloc<DetailMovieEvent, DetailMovieState> {
  MovieRepository movieRepo;
  String collectionId;

  DetailMovieBloc({required this.movieRepo, required this.collectionId})
      : super(LoadingState()) {
    on<DetailMovieEvent>((event, emit) async {
      emit(LoadedState());
      // emit(LoadingState());
      // final data= await movieRepo.getCollectionData(collectionId: collectionId);
      // emit(LoadedState(collectionResponse: data));
    });
  }
}
