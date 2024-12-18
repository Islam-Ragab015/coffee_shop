import 'package:coffee_shop/core/widgets/custom_coffee_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/coffee_cubit/coffee_cubit.dart';
import '../../../../../core/utils/app_router.dart';

class CustomFavoriteListView extends StatelessWidget {
  const CustomFavoriteListView({super.key});

  @override
  Widget build(BuildContext context) {
    var coffeeCubit = BlocProvider.of<CoffeeCubit>(context);
    return Expanded(
      child: BlocBuilder<CoffeeCubit, CoffeeState>(
        builder: (context, state) {
          return GridView.builder(
            scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.67,
              crossAxisSpacing: 9,
              mainAxisSpacing: 9,
            ),
            itemCount: coffeeCubit.userFavorite.length,
            itemBuilder: (BuildContext context, int index) {
              final coffeeModel = coffeeCubit.userFavorite[index];
              return CustomCoffeeListTile(
                coffeeCubit: coffeeCubit,
                coffeeModel: coffeeModel,
                onPressed: () {
                  GoRouter.of(context).push(
                    AppRouter.kDrinkOrderSpecifications,
                    extra: coffeeModel,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
