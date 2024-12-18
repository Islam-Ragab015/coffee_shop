import 'package:coffee_shop/core/widgets/custom_pages_app_bar.dart';
import 'package:coffee_shop/features/favorite/presentation/views/widgets/custom_favorite_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/coffee_cubit/coffee_cubit.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/font_manager.dart';
import '../../../../../core/utils/strings_manager.dart';
import '../../../../../core/utils/styles_manager.dart';
import '../../../../../core/utils/values_manager.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final isColorDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
      child: BlocBuilder<CoffeeCubit, CoffeeState>(
        builder: (context, state) {
          var coffeeCubit = BlocProvider.of<CoffeeCubit>(context);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: AppSize.s28,
              ),
              CustomPagesAppBar(
                title: AppStrings.favorite,
                onTap: () {
                  context.read<CoffeeCubit>().clearFavorite();
                },
                imagePath: ImageAssets.deleteIcon,
              ),
              const SizedBox(
                height: AppSize.s10,
              ),
              Text(
                'Items (${coffeeCubit.userFavorite.length})',
                style: getSemiBoldStyle(
                  color: isColorDark ? ColorManager.white : ColorManager.black,
                  fontSize: FontSize.s16,
                ),
              ),
              const CustomFavoriteListView(),
            ],
          );
        },
      ),
    );
  }
}
