import 'package:coffee_shop/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/coffee_cubit/coffee_cubit.dart';
import 'custom_type_drink.dart';

class CustomTypeDrinkSelector extends StatelessWidget {
  const CustomTypeDrinkSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoffeeCubit, CoffeeState>(
      builder: (context, state) {
        var coffeeCubit = BlocProvider.of<CoffeeCubit>(context);
        return SizedBox(
          height: AppSize.s32,
          child: Padding(
            padding: const EdgeInsets.only(left: AppPadding.p23),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CustomTypeDrink(
                  text: 'White Chocolate',
                  isSelected: coffeeCubit.selectedType == 'White Chocolate',
                  onTap: () {
                    coffeeCubit.changeSelectedType(newType: 'White Chocolate');
                  },
                ),
                const SizedBox(width: 10),
                CustomTypeDrink(
                  text: 'Milk Chocolate',
                  isSelected: coffeeCubit.selectedType == 'Milk Chocolate',
                  onTap: () {
                    coffeeCubit.changeSelectedType(newType: 'Milk Chocolate');
                  },
                ),
                const SizedBox(width: 10),
                CustomTypeDrink(
                  text: 'Dark Chocolate',
                  isSelected: coffeeCubit.selectedType == 'Dark Chocolate',
                  onTap: () {
                    coffeeCubit.changeSelectedType(newType: 'Dark Chocolate');
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
