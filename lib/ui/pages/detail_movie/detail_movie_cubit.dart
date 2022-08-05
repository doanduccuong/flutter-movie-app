import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'detail_movie_state.dart';

class DetailMovieCubit extends Cubit<DetailMovieState> {
  DetailMovieCubit() : super(DetailMovieInitial());
}
