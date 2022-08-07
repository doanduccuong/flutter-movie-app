import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailInitialState> {
  MovieDetailCubit() : super(MovieDetailInitialState());
}
