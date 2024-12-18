import 'package:coffee_shop/core/utils/color_manager.dart';
import 'package:coffee_shop/core/utils/font_manager.dart';
import 'package:coffee_shop/core/utils/styles_manager.dart';
import 'package:coffee_shop/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/strings_manager.dart';
import '../../../../../core/widgets/custom_pages_app_bar.dart';
import '../../../../home/presentation/manager/theme/theme_cubit.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final isColorDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.s24),
      child: Column(
        children: [
          CustomPagesAppBar(
            title: AppStrings.profile,
            onTap: () {},
            imagePath: ImageAssets.setting,
          ),
          buildSizedBox(),
          const CircleAvatar(
            backgroundImage: AssetImage(
              ImageAssets.ellipse2,
            ),
            radius: AppSize.s40,
          ),
          buildSizedBox(),
          Text(
            AppStrings.name,
            style: getSemiBoldStyle(
                color: isColorDark ? ColorManager.white : ColorManager.black,
                fontSize: FontSize.s16),
          ),
          buildSizedBox(),
          Container(
            width: double.infinity,
            height: 2,
            color: Colors.black,
          ),
          buildSizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Dark',
                style: getBoldStyle(
                  color: isColorDark ? ColorManager.white : ColorManager.black,
                  fontSize: FontSize.s20,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.brightness_6),
                onPressed: () {
                  context.read<ThemeCubit>().toggleTheme();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  SizedBox buildSizedBox() => const SizedBox(
        height: AppSize.s25,
      );
}
