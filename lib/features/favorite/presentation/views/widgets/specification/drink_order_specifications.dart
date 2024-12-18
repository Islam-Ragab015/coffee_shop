// import 'package:coffee_shop/core/utils/assets_manager.dart';
// import 'package:coffee_shop/core/utils/color_manager.dart';
// import 'package:coffee_shop/core/utils/strings_manager.dart';
// import 'package:coffee_shop/core/utils/styles_manager.dart';
// import 'package:coffee_shop/core/utils/values_manager.dart';
// import 'package:coffee_shop/features/shop/presentation/views/widgets/custom_button.dart';
// import 'package:coffee_shop/features/shop/presentation/views/widgets/drink_order_specifications_top_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:go_router/go_router.dart';
//
// import '../../../../../core/coffee_cubit/coffee_cubit.dart';
// import '../../../../../core/utils/font_manager.dart';
// import '../../../../../core/widgets/custom_show_snack_bar.dart';
// import '../../../../home/data/models/coffee_model.dart';
// import 'choose_count_drinks.dart';
// import 'custom_description_widget.dart';
// import 'custom_size_drink_selector.dart';
// import 'custom_type_drink_selector.dart';
//
// class DrinkOrderSpecifications extends StatelessWidget {
//   const DrinkOrderSpecifications({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final isColorDark = Theme.of(context).brightness == Brightness.dark;
//     final coffeeModel = GoRouterState.of(context).extra as CoffeeModel;
//     final coffeeCubit = BlocProvider.of<CoffeeCubit>(context);
//
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const DrinkOrderSpecificationsTopImage(),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 23.0),
//                 child: Text(
//                   'Description',
//                   style: getBoldStyle(
//                     fontSize: AppSize.s15,
//                     color: isColorDark ? ColorManager.white : ColorManager.black,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: AppSize.s10),
//               const CustomTextWidget(),
//               const SizedBox(height: AppSize.s20),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: AppPadding.p23),
//                 child: Text(
//                   'Choice of Chocolate',
//                   style: getBoldStyle(
//                     fontSize: AppSize.s15,
//                     color: isColorDark ? ColorManager.white : ColorManager.black,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: AppSize.s15),
//               const CustomTypeDrinkSelector(),
//               const SizedBox(height: AppSize.s20),
//               Padding(
//                 padding: const EdgeInsets.only(left: AppPadding.p23, right: AppPadding.p56),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Size',
//                       style: getBoldStyle(color: ColorManager.black, fontSize: FontSize.s15),
//                     ),
//                     Text(
//                       'Quantity',
//                       style: getBoldStyle(color: ColorManager.black, fontSize: FontSize.s15),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: AppSize.s15),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: AppPadding.p23),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const CustomSizeDrinkSelector(),
//                     ChooseCountDrinks(
//                       cartItem: coffeeModel, // استخدام coffeeModel هنا
//                       increment: (item) => coffeeCubit.incrementItemQuantity(item),
//                       decrement: (item) => coffeeCubit.decrementItemQuantity(item),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: AppPadding.p23, vertical: AppPadding.p20),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Column(
//                       children: [
//                         Text(
//                           'Price',
//                           style: getRegularStyle(
//                             color: isColorDark ? ColorManager.lightGrey2 : ColorManager.lightGrey,
//                             fontSize: FontSize.s14,
//                           ),
//                         ),
//                         const SizedBox(height: AppSize.s5),
//                         Row(
//                           children: [
//                             SvgPicture.asset(
//                               ImageAssets.dollarImage,
//                               height: AppSize.s22,
//                               width: AppSize.s16,
//                             ),
//                             const SizedBox(width: AppSize.s5),
//                             Text(
//                               '${coffeeModel.price}',
//                               style: getBoldStyle(
//                                 color: isColorDark ? ColorManager.white : ColorManager.black,
//                                 fontSize: AppSize.s24,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     CustomButton(
//                       text: AppStrings.buyNow,
//                       onTap: () {
//                         coffeeCubit.addItemToCart(coffeeModel);
//                         CustomShowSnackBar.show(context, 'Successfully added to cart');
//                         Navigator.pop(context);
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class CustomContainerIcon extends StatelessWidget {
//   const CustomContainerIcon({
//     super.key,
//     required this.imagePath,
//     this.onTap,
//     this.bgColor,
//     this.imageColor,
//   });
//
//   final String imagePath;
//   final void Function()? onTap;
//   final Color? bgColor;
//   final Color? imageColor;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.all(AppPadding.p8),
//         width: AppSize.s35,
//         height: AppSize.s35,
//         decoration: BoxDecoration(shape: BoxShape.circle, color: bgColor),
//         //#2F3548
//         child: SvgPicture.asset(
//           imagePath,
//           colorFilter: ColorFilter.mode(
//             imageColor ?? ColorManager.error,
//             BlendMode.srcIn,
//           ),
//         ),
//       ),
//     );
//   }
// }
