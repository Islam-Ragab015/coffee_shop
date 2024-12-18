import 'package:flutter/material.dart';

import '../../../../../core/coffee_cubit/coffee_cubit.dart';

class CustomItemDetails extends StatelessWidget {
  const CustomItemDetails(
      {super.key, required this.coffeeCubit, required this.index});

  final CoffeeCubit coffeeCubit;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Size : ${coffeeCubit.userCurt[index].size}'),
        const SizedBox(
          width: 30,
        ),
        Text('quantity : ${coffeeCubit.userCurt[index].quantity}'),
      ],
    );
  }
}
