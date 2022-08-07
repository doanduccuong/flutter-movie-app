import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/common/app_colors.dart';
import 'package:flutter_base/models/entities/movie_entity.dart';
import 'package:flutter_base/router/route_config.dart';
import 'package:flutter_base/ui/pages/detail_movie/detail_movie_page.dart';
import 'package:flutter_base/ui/pages/detail_movie/widget/category_container.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class CarouselSliderCustom extends StatefulWidget {
  final double? height;
  final double? viewportFraction;
  final List<String> listImage;
  final List<MovieEntity> listDetailMovie;

  const CarouselSliderCustom(
      {Key? key,
      this.height,
      this.viewportFraction,
      required this.listImage,
      required this.listDetailMovie})
      : super(key: key);

  @override
  State<CarouselSliderCustom> createState() => _CarouselSliderCustomState();
}

class _CarouselSliderCustomState extends State<CarouselSliderCustom> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
            carouselController: _controller,
            items: widget.listDetailMovie
                .map((item) => InkWell(
                      // onTap: () => Get.offNamed(RouteConfig.detailMoviePage,
                      //     arguments: DetailMovieArgument(movieEntity: item)),
                      child: Container(
                        alignment: Alignment.bottomRight,
                        width: 328,
                        padding: const EdgeInsets.only(bottom: 10, right: 10),
                        margin: const EdgeInsets.symmetric(horizontal: 19),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                    "https://image.tmdb.org/t/p/w500/${item.backdropPath}")),
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.backgroundDark),
                        child: CategoryContainer(
                          title: 'IMDb ${item.voteAverage}',
                          backgroundColor: AppColors.scoreBackgroundColor,
                        ),
                      ),
                    ))
                .toList(),
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
              height: widget.height ?? 141,
              viewportFraction: widget.viewportFraction ?? 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: false,
              scrollDirection: Axis.horizontal,
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.listImage.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 10.0,
                height: 10.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
