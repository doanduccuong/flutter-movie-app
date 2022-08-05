import 'package:flutter/material.dart';
import 'package:flutter_base/common/app_colors.dart';
import 'package:flutter_base/common/app_images.dart';
import 'package:flutter_base/common/app_text_styles.dart';
import 'package:flutter_base/models/entities/movie_entity.dart';
import 'package:flutter_base/ui/pages/detail_movie/widget/actor_container.dart';
import 'package:flutter_base/ui/pages/detail_movie/widget/category_container.dart';
import 'package:readmore/readmore.dart';

class ModalBottomSheetCustom extends StatelessWidget {
  final MovieEntity movieData;

  const ModalBottomSheetCustom({Key? key, required this.movieData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final modalBottomSheetHeight = MediaQuery.of(context).size.height * 2 / 3;
    return SizedBox(
      height: modalBottomSheetHeight,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.firstLinearBackGroundColor,
              AppColors.secondLinearBackGroundColor
            ],
          ),
        ),
        child: Column(
          children: [
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 180, vertical: 10),
                child: Divider(
                  color: AppColors.textWhite,
                  thickness: 1,
                )),
            Text(
              movieData.title ?? "",
              style: AppTextStyle.white.copyWith(fontSize: 30),
              softWrap: true,
              maxLines: 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CategoryContainer(title: 'Action', textSize: 12),
                  const CategoryContainer(title: '16+', textSize: 12),
                  CategoryContainer(
                    title: 'IMDb ${movieData.voteAverage ?? ""}',
                    backgroundColor: AppColors.scoreBackgroundColor,
                    textSize: 12,
                  ),
                  Image.asset(AppImages.shareIconColor),
                  Image.asset(AppImages.heartIconColor),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 27),
              child: ReadMoreText(
                movieData.overview ?? "",
                trimCollapsedText: "More",
                style: AppTextStyle.white
                    .copyWith(color: AppColors.textWhite.withOpacity(0.7)),
                trimExpandedText: "Less",
                moreStyle: AppTextStyle.tint.copyWith(color: AppColors.third),
                lessStyle: AppTextStyle.tint.copyWith(color: AppColors.third),
              ),
            ),
            _buildCastField(),
          ],
        ),
      ),
    );
  }
}

Widget _buildCastField() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            ActorContainer(),
            ActorContainer(),
            ActorContainer(),
            ActorContainer(),
            ActorContainer(),
          ],
        ),
      ],
    ),
  );
}
