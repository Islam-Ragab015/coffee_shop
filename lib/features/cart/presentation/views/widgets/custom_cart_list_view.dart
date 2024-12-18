import 'package:coffee_shop/features/cart/presentation/views/widgets/custom_cart_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/coffee_cubit/coffee_cubit.dart';
import '../../../../../core/utils/values_manager.dart';

class CustomCartListView extends StatelessWidget {
  const CustomCartListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoffeeCubit, CoffeeState>(
      builder: (context, state) {
        var coffeeCubit = BlocProvider.of<CoffeeCubit>(context);
        return Expanded(
          child: ListView.builder(
            itemCount: coffeeCubit.userCurt.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key('${coffeeCubit.userCurt[index]}'),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  coffeeCubit.removeItemFromCart(coffeeCubit.userCurt[index]);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Item ${index + 1} deleted')),
                  );
                },
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: AppPadding.p7_5),
                  child: CustomCartListTile(
                    coffeeCubit: coffeeCubit,
                    index: index,
                  ),
                ),
              );

              //   Padding(
              //   padding: const EdgeInsets.symmetric(vertical: AppPadding.p7_5),
              //   child:
              //   CustomCartListTile(
              //     coffeeCubit: coffeeCubit,
              //     index: index,
              //   ),
              //   // CustomShowSecondWidget(
              //   //   coffeeCubit: coffeeCubit,
              //   //   index: index,
              //   //   onTap: () {
              //   //     coffeeCubit.removeItemFromCart(coffeeCubit.userCurt[index]);
              //   //   },
              //   // ),
              // );
            },
          ),
        );
      },
    );
  }
}
