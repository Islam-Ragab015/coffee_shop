import 'package:coffee_shop/core/utils/color_manager.dart';
import 'package:coffee_shop/core/utils/styles_manager.dart';
import 'package:coffee_shop/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, this.onTap});
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 46, vertical: 11),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: ColorManager.brownShade),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              text,
              style: getMediumStyle(
                  color: ColorManager.white, fontSize: AppSize.s16),
            ),
          ],
        ),
      ),
    );
  }
}
