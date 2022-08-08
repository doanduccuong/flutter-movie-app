import 'package:flutter/material.dart';
import 'package:flutter_base/common/app_colors.dart';
import 'package:flutter_base/common/app_images.dart';
import 'package:flutter_base/common/app_text_styles.dart';
import 'package:flutter_base/models/entities/movie_entity.dart';
import 'package:flutter_base/ui/pages/detail_movie/movie_detail_bloc/movie_detail_bloc.dart';
import 'package:flutter_base/ui/pages/detail_movie/widget/actor_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:readmore/readmore.dart';

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
  @override
  Widget build(BuildContext context) {
    final movieData =
        ModalRoute.of(context)!.settings.arguments as DetailMovieArgument;

    return BlocProvider(
      create: (BuildContext context) => MovieDetailBloc(),
      child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
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
                      "https://image.tmdb.org/t/p/w500/${movieData.movieEntity.posterPath}",
                    ),
                  ),
                ),
                child: DraggableScrollableSheet(
                    initialChildSize: 0.5,
                    minChildSize: 0.5,
                    maxChildSize: 0.7,
                    builder: ((context, scrollController) {
                      return Container(
                          width: 428,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xff2b5876),
                                Color(0xff4e4376),
                              ],
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                50,
                              ),
                              topRight: Radius.circular(50),
                            ),
                          ),
                          padding: const EdgeInsets.only(
                              top: 30, left: 50, right: 50),
                          child: SingleChildScrollView(
                            controller: scrollController,
                            child: Column(
                              children: [
                                Center(
                                  child: Text(
                                    movieData.movieEntity.title ?? '',
                                    style: AppTextStyle.blackS12Bold
                                        .copyWith(fontSize: 40),
                                  ),
                                ),
                                Text(
                                  'Actinnnnnnnnnnsdsadasdsdadadsonn',
                                  style: AppTextStyle.blackS12Bold.copyWith(
                                    fontSize: 18,
                                    color: AppColors.textWhite.withOpacity(0.5),
                                  ),
                                ),
                                const SizedBox(
                                  height: 27,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        _buildMovieType(),
                                        _buildViewerScore(movieData),
                                      ],
                                    ),
                                    _buildIconConnection()
                                  ],
                                ),
                                const SizedBox(height: 17),
                                ReadMoreText(
                                  movieData.movieEntity.overview ?? '',
                                  trimLines: 3,
                                  trimMode: TrimMode.Line,
                                  colorClickableText: const Color(0xffA6A1E0),
                                  trimExpandedText: 'Less',
                                  trimCollapsedText: 'More',
                                  style: TextStyle(
                                    color:
                                        AppColors.textWhite.withOpacity(0.75),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Cast',
                                      style: AppTextStyle.textStyleBold
                                          .copyWith(fontSize: 18),
                                    ),
                                    const Text(
                                      'See All',
                                      style: AppTextStyle.textStyleMedium,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: AppImages.actor.map((e) {
                                    return ActorCard(
                                      textStyle: AppTextStyle.textStyleRegular,
                                      image: e[0],
                                      actorName: e[1],
                                      charName: e[2],
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ));
                    })),
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

Widget _buildIconConnection() {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: const [
      Icon(Icons.share),
      SizedBox(width: 10),
      Icon(Icons.favorite_outlined)
    ],
  );
}

Widget _buildViewerScore(DetailMovieArgument movieData) {
  return Container(
    width: 73,
    height: 23,
    padding: const EdgeInsets.only(left: 6.5, right: 10),
    decoration: BoxDecoration(
      color: const Color(0xfff5c518),
      borderRadius: BorderRadius.circular(15),
      boxShadow: const [
        BoxShadow(
          color: Color(0x4000000000),
          blurRadius: 15,
          offset: Offset(4, 4),
        )
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "IMDB",
          style: AppTextStyle.blackS12Bold,
        ),
        Text(
          movieData.movieEntity.voteAverage.toString(),
          style: AppTextStyle.textStyleBold.copyWith(
            fontSize: 12,
            color: AppColors.textWhite,
          ),
        )
      ],
    ),
  );
}

Widget _buildMovieType() {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
    decoration: BoxDecoration(
        color: AppColors.backgroundDark,
        borderRadius: BorderRadius.circular(10)),
    child: Text(
      "Movie Type",
      style: AppTextStyle.white.copyWith(fontWeight: FontWeight.w600),
    ),
  );
}
