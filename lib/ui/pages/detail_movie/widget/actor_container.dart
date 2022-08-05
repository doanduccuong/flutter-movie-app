import 'package:flutter/material.dart';
import 'package:flutter_base/common/app_colors.dart';
import 'package:flutter_base/common/app_text_styles.dart';

class ActorContainer extends StatelessWidget {
  const ActorContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: AppColors.textDisable,
              borderRadius: BorderRadius.circular(15)),
        ),
        SizedBox(
          height: 20,
          width: 46,
          child: Text(
            "Chris Hemsworth",
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.white.copyWith(fontSize: 8),
            softWrap: true,
            maxLines: 2,
          ),
        ),
        SizedBox(
          height: 20,
          width: 46,
          child: Text(
            "Thor",
            textAlign: TextAlign.center,
            style: AppTextStyle.white.copyWith(
                fontSize: 10, color: AppColors.textWhite.withOpacity(0.5)),
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            maxLines: 2,
          ),
        )
      ],
    );
  }
}
