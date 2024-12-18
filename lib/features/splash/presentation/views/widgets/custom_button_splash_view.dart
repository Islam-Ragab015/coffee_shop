import 'package:coffee_shop/core/utils/color_manager.dart';
import 'package:coffee_shop/core/utils/styles_manager.dart';
import 'package:coffee_shop/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/assets_manager.dart';

class CustomButtonSplashView extends StatelessWidget {
  const CustomButtonSplashView({super.key, required this.text, this.onTap});
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(25),
        width: 151,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: ColorManager.brownShade),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              text,
              style: getRegularStyle(
                  color: ColorManager.white, fontSize: AppSize.s16),
            ),
            SvgPicture.asset(
              ImageAssets.arrowRight,
            ),
          ],
        ),
      ),
    );
  }
}
