import 'package:coffee_shop/core/utils/color_manager.dart';
import 'package:coffee_shop/core/utils/styles_manager.dart';
import 'package:coffee_shop/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

class CustomTypeDrink extends StatelessWidget {
  const CustomTypeDrink({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isColorDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: isSelected
                ? ColorManager.brownShade
                : isColorDark
                    ? ColorManager.darkBlue
                    : ColorManager.greyOpacityLight,
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
              color: ColorManager.brownShade,
            ),
          ),
          child: Center(
            child: Text(
              text,
              style: getMediumStyle(
                color: isSelected
                    ? ColorManager.white
                    : isColorDark
                        ? ColorManager.white
                        : ColorManager.lightGrey,
                fontSize: AppSize.s12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
