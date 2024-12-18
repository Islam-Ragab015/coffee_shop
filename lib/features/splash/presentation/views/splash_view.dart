import 'package:coffee_shop/core/utils/color_manager.dart';
import 'package:coffee_shop/core/utils/strings_manager.dart';
import 'package:coffee_shop/core/utils/styles_manager.dart';
import 'package:coffee_shop/features/splash/presentation/views/widgets/custom_button_splash_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_router.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/utils/values_manager.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final isColorDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor:
          isColorDark ? ColorManager.darkBlue : ColorManager.lightBeige,
      body: SafeArea(
        child: SingleChildScrollView(
          // Wrap the Column with this
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p37),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage(
                    ImageAssets.splashLogo,
                  ),
                ),
                const SizedBox(
                  height: AppSize.s88,
                ),
                Text(
                  AppStrings.stayFocused,
                  style: getSemiBoldStyle(
                      color: isColorDark
                          ? ColorManager.white
                          : ColorManager.darkBrown),
                ),
                const SizedBox(
                  height: AppSize.s20,
                ),
                Text(
                  AppStrings.getTheCup,
                  style: getRegularStyle(
                      color: isColorDark
                          ? ColorManager.greyWithOpacity
                          : ColorManager.greyOpacity,
                      fontSize: AppSize.s14),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: AppSize.s77,
                ),
                CustomButtonSplashView(
                  text: AppStrings.diveIn,
                  onTap: () {
                    GoRouter.of(context).pushReplacement(
                      AppRouter.kHomeView,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
