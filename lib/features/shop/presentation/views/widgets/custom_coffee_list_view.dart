import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/coffee_cubit/coffee_cubit.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../home/data/models/coffee_model.dart';
import '../../manager/search_cubit/search_cubit.dart';
import '../../../../../core/widgets/custom_coffee_list_tile.dart';
import '../../manager/selected_item_cubit/filtered_shop _cubit.dart';

class CustomCoffeeListView extends StatelessWidget {
  final List<CoffeeModel> coffeeList;

  const CustomCoffeeListView({super.key, required this.coffeeList});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilteredShopCubit, List<CoffeeModel>>(
      builder: (context, filteredCoffeeList) {
        return BlocBuilder<SearchCubit, List<CoffeeModel>>(
          builder: (context, searchResults) {
            var coffeeCubit = BlocProvider.of<CoffeeCubit>(context);
            final coffeeList = searchResults.isEmpty
                ? filteredCoffeeList.isNotEmpty
                    ? filteredCoffeeList
                    : coffeeCubit.coffeeShop
                : searchResults;

            return SizedBox(
              height: 226,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio: 1.4,
                  crossAxisSpacing: 9,
                  mainAxisSpacing: 9,
                ),
                itemCount: coffeeList.length,
                itemBuilder: (BuildContext context, int index) {
                  final coffeeModel = coffeeList[index];
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
              ),
            );
          },
        );
      },
    );
  }
}
