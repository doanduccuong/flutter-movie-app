import 'package:flutter/material.dart';
import 'package:flutter_base/common/app_colors.dart';
import 'package:flutter_base/common/app_text_styles.dart';

class CategoryContainer extends StatelessWidget {
  final String title;
  final Color? backgroundColor;
  final double? textSize;

  const CategoryContainer({
    Key? key,
    required this.title,
    this.backgroundColor,
    this.textSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
      decoration: BoxDecoration(
          color: backgroundColor ?? Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.textBlack)),
      child: Text(
        title,
        style: AppTextStyle.white.copyWith(fontSize: textSize ?? 6),
      ),
    );
  }
}
