import 'package:flutter/material.dart';
import 'package:flutter_base/common/app_colors.dart';
import 'package:flutter_base/common/app_text_styles.dart';
import 'package:flutter_base/models/entities/movie_entity.dart';
import 'package:flutter_base/ui/pages/detail_movie/widget/category_container.dart';

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
            Row(
              children: [
                CategoryContainer(title: '',)
              ],
            )
          ],
        ),
      ),
    );
  }
}
