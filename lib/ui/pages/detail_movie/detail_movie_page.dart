import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_base/common/app_colors.dart';
import 'package:flutter_base/models/entities/movie_entity.dart';
import 'package:flutter_base/repositories/movie_repository.dart';
import 'package:flutter_base/ui/pages/detail_movie/widget/modal_bottom_sheet_custom.dart';
import 'package:flutter_base/ui/pages/movie_detail/movie_detail_bloc/movie_detail_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

class DetailMovieArgument {
  MovieEntity movieEntity;

  DetailMovieArgument({required this.movieEntity});
}

class DetailMoviePage extends StatefulWidget {
  const DetailMoviePage({Key? key}) : super(key: key);

  @override
  State<DetailMoviePage> createState() => _DetailMoviePageState();
}

class _DetailMoviePageState extends State<DetailMoviePage> {
  final movieData = Get.arguments as DetailMovieArgument;

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      showModalBottomSheet<void>(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25.0),
          ),
        ),
        context: context,
        builder: (BuildContext context) {
          return ModalBottomSheetCustom(
            movieData: movieData.movieEntity,
          );
        },
      );
    });
    return BlocProvider(
      create: (BuildContext context) => MovieDetailBloc(
          movieRepo: context.read<MovieRepositoryImpl>(),
          collectionId: "1231331313"),
      child: BlocBuilder(
        builder: (BuildContext context, state) {
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadedState) {
            return Scaffold(
              body: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      "https://image.tmdb.org/t/p/w500/${movieData.movieEntity.backdropPath}",
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.textWhite,
                      ),
                    )
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
