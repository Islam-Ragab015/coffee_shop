import 'package:coffee_shop/core/utils/assets_manager.dart';
import 'package:coffee_shop/core/utils/font_manager.dart';
import 'package:coffee_shop/core/utils/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/coffee_cubit/coffee_cubit.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/values_manager.dart';
import '../../../../home/data/models/coffee_model.dart';

class ChooseCountDrinks extends StatelessWidget {
  final CoffeeModel cartItem;
  final Function(CoffeeModel) increment;
  final Function(CoffeeModel) decrement;

  const ChooseCountDrinks({
    super.key,
    required this.cartItem,
    required this.increment,
    required this.decrement,
  });

  @override
  @override
  Widget build(BuildContext context) {
    final isColorDark = Theme.of(context).brightness == Brightness.dark;

    return BlocBuilder<CoffeeCubit, CoffeeState>(
      builder: (context, state) {
        return Row(
          children: [
            CustomCounterIcon(
              onTap: () {
                decrement(cartItem);
              },
              imagePath: ImageAssets.minusIcon,
            ),
            const SizedBox(
              width: AppSize.s16,
            ),
            Text(
              '${cartItem.quantity}',
              style: getSemiBoldStyle(
                color: isColorDark
                    ? ColorManager.white
                    : ColorManager.darkBlueGrey,
                fontSize: FontSize.s14,
              ),
            ),
            const SizedBox(
              width: AppSize.s16,
            ),
            CustomCounterIcon(
              onTap: () {
                increment(cartItem);
              },
              imagePath: ImageAssets.plusIcon,
            ),
          ],
        );
      },
    );
  }
}

class CustomCounterIcon extends StatelessWidget {
  const CustomCounterIcon(
      {super.key, required this.onTap, required this.imagePath});

  final void Function() onTap;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: AppSize.s40,
        height: AppSize.s40,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: ColorManager.brownShade,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SvgPicture.asset(imagePath),
          ),
        ),
      ),
    );
  }
}
