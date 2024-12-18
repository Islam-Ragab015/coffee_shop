import 'package:coffee_shop/core/utils/assets_manager.dart';
import 'package:coffee_shop/core/utils/color_manager.dart';
import 'package:coffee_shop/core/utils/font_manager.dart';
import 'package:coffee_shop/core/utils/styles_manager.dart';
import 'package:coffee_shop/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/coffee_cubit/coffee_cubit.dart';
import '../../../../home/data/models/coffee_model.dart';

class CustomCartListTile extends StatelessWidget {
  const CustomCartListTile({
    super.key,
    required this.coffeeCubit,
    required this.index,
  });

  final CoffeeCubit coffeeCubit;
  final int index;

  @override
  Widget build(BuildContext context) {
    final isColorDark = Theme.of(context).brightness == Brightness.dark;
    final cartItem = coffeeCubit.userCurt[index];

    return Container(
      decoration: BoxDecoration(
        color: isColorDark ? ColorManager.darkBlueGrey : ColorManager.white70,
        borderRadius: BorderRadius.circular(AppSize.s12),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: AppPadding.p20,
        horizontal: AppPadding.p10,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              coffeeCubit.selectedItemCart(index);
            },
            child: Container(
              height: AppSize.s20,
              width: AppSize.s20,
              decoration: cartItem.isSelected
                  ? BoxDecoration(
                      color: ColorManager.brownShade,
                      borderRadius: BorderRadius.circular(AppSize.s12),
                      border: Border.all(
                        color: ColorManager.brownShade,
                      ),
                      image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                            isColorDark
                                ? ColorManager.black
                                : ColorManager.white,
                            BlendMode.srcIn),
                        image: const AssetImage(
                          ImageAssets.trueIcon,
                        ),
                      ),
                    )
                  : BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(AppSize.s12),
                      border: Border.all(
                        color: ColorManager.brownShade,
                      ),
                    ),
            ),
          ),
          const SizedBox(
            width: AppSize.s10,
          ),
          SizedBox(
            width: AppSize.s80,
            height: AppSize.s80,
            child: Image(
              image: AssetImage(
                coffeeCubit.userCurt[index].imagePath,
              ),
            ),
          ),
          const SizedBox(
            width: AppSize.s12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                coffeeCubit.userCurt[index].title,
                style: getMediumStyle(
                  color: isColorDark ? ColorManager.white : ColorManager.black,
                  fontSize: FontSize.s14,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: AppSize.s5,
              ),
              Text(
                'US \$${coffeeCubit.userCurt[index].price}',
                style: getBoldStyle(
                  color: isColorDark ? ColorManager.white : ColorManager.black,
                  fontSize: FontSize.s16,
                ),
              ),
              const SizedBox(
                height: AppSize.s11,
              ),
              Row(
                children: [
                  Text(
                    'Delivery fee US \$3',
                    style: getRegularStyle(
                      color: ColorManager.brightOrange,
                      fontSize: FontSize.s10,
                    ),
                  ),
                  const SizedBox(
                    width: AppSize.s17,
                  ),
                  ChooseCountDrinksCart(
                    cartItem: cartItem,
                    increment: (item) =>
                        coffeeCubit.incrementItemQuantity(item),
                    decrement: (item) =>
                        coffeeCubit.decrementItemQuantity(item),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ChooseCountDrinksCart extends StatelessWidget {
  final CoffeeModel cartItem;
  final Function(CoffeeModel) increment;
  final Function(CoffeeModel) decrement;

  const ChooseCountDrinksCart({
    super.key,
    required this.cartItem,
    required this.increment,
    required this.decrement,
  });

  @override
  @override
  Widget build(BuildContext context) {
    final isColorDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      children: [
        CustomCounterIconCart(
          onTap: () {
            decrement(cartItem);
          },
          imagePath: ImageAssets.minusIcon,
        ),
        const SizedBox(
          width: AppSize.s7,
        ),
        Text(
          '${cartItem.quantity}',
          style: getSemiBoldStyle(
            color: isColorDark ? ColorManager.white : ColorManager.darkBlueGrey,
            fontSize: FontSize.s14,
          ),
        ),
        const SizedBox(
          width: AppSize.s7,
        ),
        CustomCounterIconCart(
          onTap: () {
            increment(cartItem);
          },
          imagePath: ImageAssets.plusIcon,
        ),
      ],
    );
  }
}

class CustomCounterIconCart extends StatelessWidget {
  const CustomCounterIconCart(
      {super.key, required this.onTap, required this.imagePath});

  final void Function() onTap;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: AppSize.s18,
        width: AppSize.s18,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s5),
            border: Border.all(color: ColorManager.brownShade),
          ),
          child: Center(
            child: SvgPicture.asset(
              imagePath,
              colorFilter: ColorFilter.mode(
                ColorManager.brownShade,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
