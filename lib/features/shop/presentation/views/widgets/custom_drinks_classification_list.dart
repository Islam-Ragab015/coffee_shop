import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coffee_shop/core/utils/color_manager.dart';
import 'package:coffee_shop/core/utils/strings_manager.dart';
import 'package:coffee_shop/core/utils/styles_manager.dart';
import 'package:coffee_shop/core/utils/values_manager.dart';

import '../../../../home/data/models/coffee_model.dart';
import '../../manager/selected_item_cubit/filtered_shop _cubit.dart';

class CustomDrinksClassificationList extends StatelessWidget {
  const CustomDrinksClassificationList({super.key});

  final List<String> drinks = const [
    AppStrings.all,
    AppStrings.espresso,
    AppStrings.latte,
    AppStrings.cappuccino,
    AppStrings.cafetiere,
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilteredShopCubit, List<CoffeeModel>>(
      builder: (context, filteredShop) {
        final isColorDark = Theme.of(context).brightness == Brightness.dark;
        final selectedIndex = context.read<FilteredShopCubit>().selectedIndex;

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                drinks.length,
                (index) {
                  final isSelected = selectedIndex == index;

                  return GestureDetector(
                    onTap: () {
                      context
                          .read<FilteredShopCubit>()
                          .filterByClassification(drinks[index], index);
                    },
                    child: Column(
                      children: [
                        Text(
                          drinks[index],
                          style: getSemiBoldStyle(
                            color: isSelected
                                ? ColorManager.brownShade
                                : isColorDark
                                    ? ColorManager.lightText
                                    : ColorManager.grey,
                            fontSize: AppSize.s14,
                          ),
                        ),
                        const SizedBox(height: AppSize.s10),
                        if (isSelected)
                          Container(
                            width: AppSize.s10,
                            height: AppSize.s10,
                            decoration: BoxDecoration(
                              color: ColorManager.brownShade,
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
