import 'package:flutter/material.dart';
import 'package:flutter_base/common/app_colors.dart';
import 'package:flutter_base/common/app_text_styles.dart';

class CategoryMoviesItem extends StatelessWidget {
  final String? title;
  final String image;

  const CategoryMoviesItem({Key? key, this.title, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15),
      height: 100,
      width: 69,
      alignment: Alignment.center,
      decoration: BoxDecoration(
         gradient: const LinearGradient(colors: [
          Color(0x4ca6a1e0),
        Color(0x4ca1f3fe),
        ]),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.textWhite, width: 0.2),
      ),

      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: 95,
          maxWidth: 69,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(image),
            const SizedBox(height: 10),
            Text(
              title ?? "",
              style: AppTextStyle.white.copyWith(fontSize: 9),
            ),
          ],
        ),
      ),
    );
  }
}
