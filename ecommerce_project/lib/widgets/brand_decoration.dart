import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';

class BrandDecoration extends StatelessWidget {
  const BrandDecoration({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(color: AppColors.brandColor, width: 12, height: 20),
        Container(
          margin: EdgeInsets.symmetric(horizontal: Dimensions.marginSmall),
          color: AppColors.brandColor,
          width: 12,
          height: 20,
        ),
        Container(color: AppColors.brandColor, width: 12, height: 20),
      ],
    );
  }
}
