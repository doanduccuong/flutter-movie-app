import 'package:flutter/material.dart';
import 'package:flutter_base/common/app_colors.dart';
class MovieGenre extends StatelessWidget {
  const MovieGenre({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
          gradient: AppColors.gradientButtonColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Color(0x40000000),
              blurRadius: 15,
              offset: Offset(4, 4),
            )
          ]),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: Color(0xffffffff)),
      ),
    );
  }
}
