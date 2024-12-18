import 'package:coffee_shop/core/utils/assets_manager.dart';
import 'package:coffee_shop/core/utils/color_manager.dart';
import 'package:coffee_shop/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../manager/bottom_nav_bar_cubit/bottom_nav_bar_cubit.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, int>(
      builder: (context, currentIndex) {
        return Container(
          decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(AppSize.s20),
              topLeft: Radius.circular(AppSize.s20),
            ),
          ),
          child: GNav(
            selectedIndex: currentIndex,
            onTabChange: (value) {
              BlocProvider.of<BottomNavBarCubit>(context).updateIndex(value);
            },
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            padding: const EdgeInsets.symmetric(
                horizontal: AppPadding.p24, vertical: AppPadding.p30),
            tabs: [
              GButton(
                icon: Icons.home,
                text: '',
                leading: SvgPicture.asset(
                  currentIndex == 0
                      ? ImageAssets.homeNavB
                      : ImageAssets.homeNavL,
                  width: AppSize.s24,
                  height: AppSize.s24,
                ),
              ),
              GButton(
                icon: Icons.favorite,
                text: '',
                leading: SvgPicture.asset(
                  currentIndex == 1
                      ? ImageAssets.heartNavB
                      : ImageAssets.heartNavL,
                  width: AppSize.s22,
                  height: AppSize.s22,
                ),
              ),
              GButton(
                icon: Icons.shopping_bag,
                text: '',
                leading: SvgPicture.asset(
                  currentIndex == 2 ? ImageAssets.bagNavB : ImageAssets.bagNavL,
                  width: AppSize.s24,
                  height: AppSize.s24,
                ),
              ),
              GButton(
                icon: Icons.notifications,
                text: '',
                leading: SvgPicture.asset(
                  currentIndex == 3
                      ? ImageAssets.notificationNavB
                      : ImageAssets.notificationNavL,
                  width: AppSize.s24,
                  height: AppSize.s24,
                ),
              ),
              GButton(
                icon: Icons.person,
                text: '',
                leading: SvgPicture.asset(
                  currentIndex == 4
                      ? ImageAssets.profileNavLB
                      : ImageAssets.profileNavL,
                  width: AppSize.s24,
                  height: AppSize.s24,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
