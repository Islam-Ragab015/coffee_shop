import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/assets_manager.dart';
import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/strings_manager.dart';
import '../../../../../core/utils/styles_manager.dart';
import '../../../../../core/utils/values_manager.dart';
import '../../manager/search_cubit/search_cubit.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isColorDark = Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      height: AppSize.s50,
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: AppSize.s50,
              child: TextFormField(
                controller: _controller,
                decoration: InputDecoration(
                  hintText: AppStrings.findYourCoffee,
                  prefixIcon: Container(
                    padding: const EdgeInsets.all(AppPadding.p11_5),
                    child: SvgPicture.asset(
                      ImageAssets.search,
                      width: AppSize.s15,
                      height: AppSize.s15,
                      colorFilter: ColorFilter.mode(
                        isColorDark
                            ? ColorManager.greyOpacityLight
                            : ColorManager.greyOpacity,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  hintStyle: getRegularStyle(
                    color: isColorDark
                        ? ColorManager.greyOpacityLight
                        : ColorManager.blackOpacity1,
                  ),
                  fillColor: isColorDark
                      ? ColorManager.darkBlueGrey
                      : ColorManager.white,
                  filled: true,
                  focusColor: isColorDark
                      ? ColorManager.darkBlueGrey
                      : ColorManager.white,
                  border: buildOutlineInputBorder(),
                  focusedBorder: buildOutlineInputBorder(),
                  enabledBorder: buildOutlineInputBorder(),
                  disabledBorder: buildOutlineInputBorder(),
                ),
                cursorColor: isColorDark
                    ? ColorManager.darkBlueGrey
                    : ColorManager.blackOpacity1,
                onChanged: (query) {
                  context.read<SearchCubit>().search(query);
                },
              ),
            ),
          ),
          const SizedBox(width: AppSize.s11),
          SvgPicture.asset(
            ImageAssets.filterSearch,
          )
        ],
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSize.s16),
      borderSide: BorderSide(color: ColorManager.borderColor, width: 1),
    );
  }
}
