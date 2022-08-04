import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/common/app_colors.dart';

class CarouselSliderCustom extends StatefulWidget {
  final double? height;
  final double? viewportFraction;
  final List<String> listImage;
  const CarouselSliderCustom(
      {Key? key, this.height, this.viewportFraction, required this.listImage})
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
            items: widget.listImage
                .map((item) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 19),
                      decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage(item)),
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.backgroundDark),
                    ))
                .toList(),
            options: CarouselOptions(
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
      ],
    );
  }
}
