import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';

class BrandUnderLine extends StatelessWidget {
  const BrandUnderLine({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: Divider(
        color: AppColors.brandColor,
        thickness: 3,
        radius: BorderRadius.circular(
          Dimensions.borderRadiusSmall,
        ),
      ),
    );
  }
}