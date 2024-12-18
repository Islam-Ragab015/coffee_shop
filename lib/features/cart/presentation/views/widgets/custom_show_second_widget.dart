import 'package:coffee_shop/features/cart/presentation/views/widgets/custom_cart_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/coffee_cubit/coffee_cubit.dart';
import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/values_manager.dart';
import '../../manager/show_second_widget_cubit/show_second_widget_cubit.dart';

class CustomShowSecondWidget extends StatelessWidget {
  const CustomShowSecondWidget({
    super.key,
    required this.coffeeCubit,
    required this.index,
    this.onTap,
  });

  final CoffeeCubit coffeeCubit;
  final int index;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<ShowSecondWidgetCubit, ShowSecondWidgetState>(
      builder: (context, state) {
        var showSecondWidgetCubit =
            BlocProvider.of<ShowSecondWidgetCubit>(context);
        return GestureDetector(
          onHorizontalDragStart: showSecondWidgetCubit.onHorizontalDragStart,
          onHorizontalDragUpdate: showSecondWidgetCubit.onHorizontalDragUpdate,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: AppPadding.p8),
            child: Stack(
              children: [
                Transform.translate(
                  offset: Offset(
                    showSecondWidgetCubit.showSecondContainer
                        ? -screenWidth / 5
                        : 0,
                    0,
                  ),
                  child: CustomCartListTile(
                    coffeeCubit: coffeeCubit,
                    index: index,
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 100),
                  right: showSecondWidgetCubit.showSecondContainer
                      ? 0
                      : -screenWidth / 2,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.s15),
                      color: ColorManager.brightOrange,
                    ),
                    width: AppSize.s50,
                    height: AppSize.s119,
                    child: GestureDetector(
                      onTap: onTap,
                      child: Center(
                        child: SvgPicture.asset(
                          ImageAssets.deleteIconWhite,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
