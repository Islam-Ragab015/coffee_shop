import 'package:coffee_shop/core/utils/assets_manager.dart';
import 'package:coffee_shop/core/utils/color_manager.dart';
import 'package:coffee_shop/core/utils/strings_manager.dart';
import 'package:coffee_shop/core/utils/styles_manager.dart';
import 'package:coffee_shop/features/shop/presentation/manager/search_cubit/search_cubit.dart';
import 'package:coffee_shop/features/shop/presentation/views/widgets/custom_coffee_list_view.dart';
import 'package:coffee_shop/features/shop/presentation/views/widgets/custom_drinks_classification_list.dart';
import 'package:coffee_shop/features/shop/presentation/views/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/coffee_cubit/coffee_cubit.dart';
import '../../../../core/utils/values_manager.dart';
import '../../../../core/widgets/custom_coffee_app_bar.dart';
import '../../../home/data/models/coffee_model.dart';
import '../manager/selected_item_cubit/filtered_shop _cubit.dart';

class ShopView extends StatelessWidget {
  const ShopView({super.key});

  @override
  Widget build(BuildContext context) {
    final isColorDark = Theme.of(context).brightness == Brightness.dark;
    final coffeeShop = BlocProvider.of<CoffeeCubit>(context).coffeeShop;

    return Padding(
      padding: const EdgeInsets.only(
        left: AppPadding.p23,
        right: AppPadding.p23,
        top: AppPadding.p12,
      ),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => FilteredShopCubit(coffeeShop),
          ),
          BlocProvider(
            create: (context) => SearchCubit(coffeeShop),
          ),
        ],
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomCoffeeAppBar(),
              const SizedBox(height: AppSize.s30),
              RichText(
                text: TextSpan(
                  style: getSemiBoldStyle(
                    color: isColorDark ? ColorManager.white : ColorManager.grey,
                  ),
                  children: const [
                    TextSpan(text: '${AppStrings.findBest}\n'),
                    TextSpan(text: AppStrings.coffeeTaste),
                  ],
                ),
              ),
              const SizedBox(height: AppSize.s25),
              SearchWidget(),
              const SizedBox(height: AppSize.s25),
              const CustomDrinksClassificationList(),
              const SizedBox(height: AppSize.s25),
              // Displaying the CustomCoffeeListView with the filtered data
              BlocBuilder<FilteredShopCubit, List<CoffeeModel>>(
                builder: (context, filteredCoffeeList) {
                  if (filteredCoffeeList.isEmpty) {
                    return Center(
                      child: Text(
                        AppStrings.noItems,
                        style: getSemiBoldStyle(
                          color: isColorDark
                              ? ColorManager.white
                              : ColorManager.grey,
                          fontSize: AppSize.s16,
                        ),
                      ),
                    );
                  } else {
                    return CustomCoffeeListView(coffeeList: filteredCoffeeList);
                  }
                },
              ),

              const SizedBox(height: AppSize.s25),
              Text(
                AppStrings.specialForYou,
                style: getSemiBoldStyle(
                  color: isColorDark ? ColorManager.white : ColorManager.grey,
                ),
              ),
              const SizedBox(height: AppSize.s25),
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: AppPadding.p8,
                  horizontal: AppPadding.p10,
                ),
                height: AppSize.s145,
                decoration: BoxDecoration(
                  color: ColorManager.brownShade,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(AppSize.s25),
                  ),
                ),
                child: Row(
                  children: [
                    const Image(
                      image: AssetImage(ImageAssets.drinkForYou),
                      width: AppSize.s130,
                      height: AppSize.s130,
                    ),
                    const SizedBox(width: AppPadding.p14),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: AppSize.s149,
                          child: Text(
                            AppStrings.speciallyMixed,
                            style: getSemiBoldStyle(
                              color: ColorManager.white,
                              fontSize: AppSize.s14,
                            ),
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '\$11.00 ',
                                style: getSemiBoldStyle(
                                    color: ColorManager.white,
                                    fontSize: AppSize.s14),
                              ),
                              TextSpan(
                                text: '\$20.3',
                                style: getSemiBoldStyleDecoration(
                                  color: ColorManager.greyOpacityLight,
                                  fontSize: AppSize.s14,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSize.s25),
            ],
          ),
        ),
      ),
    );
  }
}
