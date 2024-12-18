import 'package:coffee_shop/core/utils/assets_manager.dart';
import 'package:coffee_shop/core/utils/color_manager.dart';
import 'package:coffee_shop/core/utils/styles_manager.dart';
import 'package:coffee_shop/core/utils/values_manager.dart';
import 'package:coffee_shop/features/home/data/models/coffee_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../coffee_cubit/coffee_cubit.dart';

class CustomCoffeeListTile extends StatelessWidget {
  const CustomCoffeeListTile({
    super.key,
    required this.coffeeCubit,
    this.onPressed,
    required this.coffeeModel,
  });

  final CoffeeCubit coffeeCubit;
  final CoffeeModel coffeeModel;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final isColorDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      decoration: BoxDecoration(
        color: isColorDark ? ColorManager.darkBlueGrey : ColorManager.white,
        borderRadius: BorderRadius.circular(AppSize.s25),
      ),
      padding: const EdgeInsets.only(
        left: AppPadding.p10,
        top: AppPadding.p10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Stack(
              children: [
                Image(
                  image: AssetImage(
                    coffeeModel.imagePath,
                  ),
                  width: double.infinity,
                  height: AppSize.s123,
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: AppSize.s73,
                    height: AppSize.s26,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          ColorManager.brownShade,
                          ColorManager.black,
                        ],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(AppSize.s25),
                        bottomLeft: Radius.circular(AppSize.s25),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(ImageAssets.starImage),
                        const SizedBox(
                          width: AppSize.s5,
                        ),
                        Text(
                          '${coffeeModel.rate}',
                          style: getSemiBoldStyle(
                            color: ColorManager.white,
                            fontSize: AppSize.s12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: AppSize.s15,
          ),
          Text(
            coffeeModel.title,
            style: getMediumStyle(
              color: isColorDark ? ColorManager.white : ColorManager.black,
              fontSize: AppSize.s16,
            ),
          ),
          const SizedBox(
            height: AppSize.s2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    coffeeModel.subTitle,
                    style: getRegularStyle(
                      color: isColorDark
                          ? ColorManager.greyWithOpacity
                          : ColorManager.blackOpacity2,
                      fontSize: AppSize.s10,
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s15,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(ImageAssets.dollarImage),
                      Text(
                        '${coffeeModel.price}',
                        style: getSemiBoldStyle(
                          color: isColorDark
                              ? ColorManager.white
                              : ColorManager.grey,
                          fontSize: AppSize.s13,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTap: onPressed,
                child: Container(
                  width: AppSize.s52,
                  height: AppSize.s53,
                  decoration: BoxDecoration(
                    color: ColorManager.brownShade,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(AppSize.s25),
                      bottomRight: Radius.circular(AppSize.s25),
                    ),
                  ),
                  child: Icon(
                    Icons.add,
                    color: ColorManager.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
