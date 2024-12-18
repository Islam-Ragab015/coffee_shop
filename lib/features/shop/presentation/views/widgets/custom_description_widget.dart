import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/styles_manager.dart';
import '../../../../../core/utils/values_manager.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isColorDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p23),
      child: ReadMoreText(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vel tincidunt et ullamcorper eu, vivamus semper commodo',
        trimLines: 2,
        colorClickableText: ColorManager.brownShade,
        trimMode: TrimMode.Line,
        trimCollapsedText: 'Read More',
        trimExpandedText: 'Show Less',
        style: getRegularStyle(
          fontSize: AppSize.s12,
          color: isColorDark ? ColorManager.white : ColorManager.black,
        ),
        moreStyle: getBoldStyle(
          fontSize: AppSize.s12,
          color: ColorManager.brownShade,
        ),
      ),
    );
  }
}
