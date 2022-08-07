import 'package:flutter/material.dart';
import 'package:flutter_base/common/app_colors.dart';
import 'package:flutter_base/common/app_images.dart';
import 'package:flutter_base/common/app_text_styles.dart';
import 'package:flutter_base/models/entities/movie_entity.dart';
import 'package:flutter_base/models/enums/load_status.dart';
import 'package:flutter_base/repositories/movie_repository.dart';
import 'package:flutter_base/ui/pages/home/movies/movies_cubit.dart';
import 'package:flutter_base/ui/pages/home/movies/movies_state.dart';
import 'package:flutter_base/ui/pages/home/movies/widgets/loading_list_widget.dart';
import 'package:flutter_base/ui/pages/home/widgets/carousel_slider_custom.dart';
import 'package:flutter_base/ui/pages/home/widgets/category_movies_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;

  final TextEditingController _searchBarController = TextEditingController();
  late MoviesCubit _cubit;

  @override
  void initState() {
    final movieRepo = RepositoryProvider.of<MovieRepository>(context);
    super.initState();
    _cubit = MoviesCubit(
      movieRepo: movieRepo,
    );
    _cubit.fetchInitialMovies();
  }

  @override
  void dispose() {
    _searchBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => MoviesCubit(
        movieRepo: context.read<MovieRepository>(),
      ),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.firstLinearBackGroundColor,
              AppColors.secondLinearBackGroundColor
            ],
          ),
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: BlocBuilder<MoviesCubit, MoviesState>(
            bloc: _cubit,
            builder: (context, state) {
              if (state.loadMovieStatus == LoadStatus.loading) {
                return const LoadingMoviesWidget();
              } else if (state.loadMovieStatus == LoadStatus.failure) {
                return Container();
              } else {
                return _buildSuccessList(state.movies);
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSuccessList(List<MovieEntity> items) {
    final List<MovieEntity> detailSlider = [
      items[0],
      items[1],
      items[2],
    ];
    final List<String> popularSlider = [
      items[0].backdropPath ?? "",
      items[1].backdropPath ?? "",
      items[2].backdropPath ?? "",
    ];
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTop(),
          const SizedBox(height: 20),
          _buildSearchBar(),
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 20),
            child: Text(
              "Most Popular",
              style: AppTextStyle.titleTextStyle,
            ),
          ),
          _buildMostPopularMovie(popularSlider, detailSlider),
          _buildCategoryMovies(),
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 20, bottom: 20),
            child: Text(
              "Upcoming realeases",
              style: AppTextStyle.titleTextStyle,
            ),
          ),
          _buildUpcomingMovies(popularSlider, detailSlider),
        ],
      ),
    );
  }

  Widget _buildCategoryMovies() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          CategoryMoviesItem(image: AppImages.genresImage, title: "Genres"),
          CategoryMoviesItem(
              image: AppImages.tvSeriesImage, title: "TV Series"),
          CategoryMoviesItem(image: AppImages.movieRollImage, title: "Movie"),
          CategoryMoviesItem(
              image: AppImages.inTheaterImage, title: "In Theatre"),
        ],
      ),
    );
  }

  Widget _buildMostPopularMovie(
      List<String> listImageSlider, List<MovieEntity> listDetailSlider) {
    return CarouselSliderCustom(
      listImage: listImageSlider,
      listDetailMovie: listDetailSlider,
    );
    // return const MoviesPage(section: MovieCategory.trending);
  }

  Widget _buildUpcomingMovies(
      List<String> listImageSlider, List<MovieEntity> listDetailSlider) {
    return CarouselSliderCustom(
      height: 214,
      viewportFraction: 0.8,
      listImage: listImageSlider,
      listDetailMovie: listDetailSlider,
    );
    // return const MoviesPage(section: MovieCategory.upcoming);
  }

  Widget _buildTop() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          "Hello, Jane",
          style: TextStyle(
            color: AppColors.textWhite,
            fontWeight: FontWeight.w700,
            fontSize: 18,
            height: 22.77 / 18,
          ),
        ),
        SizedBox(width: 174),
        Icon(
          Icons.notifications,
          color: AppColors.textWhite,
        )
      ],
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextFormField(
        controller: _searchBarController,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: const BorderSide(
              color: AppColors.textWhite,
              width: 2.0,
            ),
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.textWhite,
          ),
          suffixIcon: Icon(
            Icons.mic,
            color: AppColors.textWhite05,
          ),
          hintText: "Search",
          hintStyle: TextStyle(
            color: AppColors.textWhite05,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
