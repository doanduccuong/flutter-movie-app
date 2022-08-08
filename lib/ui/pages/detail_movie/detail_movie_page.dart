import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_base/common/app_colors.dart';
import 'package:flutter_base/models/entities/movie_entity.dart';
import 'package:flutter_base/repositories/movie_repository.dart';
import 'package:flutter_base/ui/pages/detail_movie/widget/modal_bottom_sheet_custom.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  late MovieRepository movieRepo;

  @override
  void initState() {
    movieRepo = RepositoryProvider.of<MovieRepository>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final movieData =
        ModalRoute.of(context)!.settings.arguments as DetailMovieArgument;
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
                Navigator.pop(context);
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
  }
}
