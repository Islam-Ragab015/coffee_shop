import 'package:coffee_shop/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/styles_manager.dart';

class CustomSizeDrink extends StatelessWidget {
  const CustomSizeDrink({
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
        width: AppSize.s40,
        height: AppSize.s40,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isSelected
                ? ColorManager.brownShade
                : isColorDark
                    ? ColorManager.darkBlue
                    : ColorManager.lightGrey3,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              text,
              style: getBoldStyle(
                color: isSelected
                    ? ColorManager.white
                    : isColorDark
                        ? ColorManager.darkBlueGrey
                        : ColorManager.lightGrey,
                fontSize: AppSize.s16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
