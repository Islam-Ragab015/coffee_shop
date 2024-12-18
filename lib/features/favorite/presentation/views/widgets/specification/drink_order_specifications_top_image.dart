// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:go_router/go_router.dart';
//
// import '../../../../../core/coffee_cubit/coffee_cubit.dart';
// import '../../../../../core/utils/assets_manager.dart';
// import '../../../../../core/utils/color_manager.dart';
// import '../../../../../core/utils/font_manager.dart';
// import '../../../../../core/utils/styles_manager.dart';
// import '../../../../../core/utils/values_manager.dart';
// import '../../../../home/data/models/coffee_model.dart';
// import 'drink_order_specifications.dart';
//
// class DrinkOrderSpecificationsTopImage extends StatelessWidget {
//   const DrinkOrderSpecificationsTopImage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final isColorDark = Theme.of(context).brightness == Brightness.dark;
//     final CoffeeModel coffeeModel =
//         GoRouterState.of(context).extra as CoffeeModel;
//     final coffeeCubit = BlocProvider.of<CoffeeCubit>(context);
//
//     return Padding(
//       padding: const EdgeInsets.all(AppPadding.p13),
//       child: Stack(
//         children: [
//           SizedBox(
//             height: AppSize.s400,
//             width: double.infinity,
//             child: Column(
//               children: [
//                 Image(
//                   width: double.infinity,
//                   height: AppSize.s360,
//                   fit: BoxFit.fill,
//                   image: AssetImage(coffeeModel.imagePath),
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             top: 22,
//             right: 33,
//             left: 33,
//             child: Row(
//               children: [
//                 CustomContainerIcon(
//                   imagePath: ImageAssets.arrowLeft,
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   bgColor: isColorDark
//                       ? ColorManager.darkBlueGrey
//                       : ColorManager.white,
//                   imageColor:
//                       isColorDark ? ColorManager.white : ColorManager.black,
//                 ),
//                 const Spacer(),
//                 BlocBuilder<CoffeeCubit, CoffeeState>(
//                   builder: (context, state) {
//                     final isFavorite = coffeeCubit.isFavorite(coffeeModel);
//                     return CustomContainerIcon(
//                       imagePath: ImageAssets.heartSmall,
//                       imageColor:
//                           isFavorite ? ColorManager.red : ColorManager.grey,
//                       onTap: () {
//                         if (isFavorite) {
//                           coffeeCubit.removeItemFromFavorite(coffeeModel);
//                         } else {
//                           coffeeCubit.addItemToFavorite(coffeeModel);
//                         }
//                       },
//                       bgColor: isColorDark
//                           ? ColorManager.darkBlueGrey
//                           : ColorManager.white,
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//           Positioned(
//             left: 0,
//             right: 0,
//             bottom: 0,
//             child: Container(
//               height: AppSize.s124,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(AppSize.s40),
//                 color: ColorManager.brownShade,
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.only(
//                     top: AppPadding.p20,
//                     right: AppPadding.p26,
//                     left: AppPadding.p27,
//                     bottom: AppPadding.p18),
//                 child: Row(
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'Espresso',
//                           style: getMediumStyle(
//                               color: ColorManager.white,
//                               fontSize: FontSize.s24),
//                         ),
//                         const SizedBox(
//                           height: AppSize.s2,
//                         ),
//                         Text(
//                           'with chocolate',
//                           style: getRegularStyle(
//                             color: ColorManager.whiteOpacity,
//                             fontSize: FontSize.s12,
//                           ),
//                         ),
//                         const SizedBox(
//                           height: AppSize.s16,
//                         ),
//                         Row(
//                           children: [
//                             SvgPicture.asset(ImageAssets.starImage),
//                             const SizedBox(
//                               width: AppSize.s5,
//                             ),
//                             Text(
//                               '${coffeeModel.rate}',
//                               style: getSemiBoldStyle(
//                                 color: ColorManager.white,
//                                 fontSize: AppSize.s12,
//                               ),
//                             ),
//                             const SizedBox(
//                               width: AppSize.s5,
//                             ),
//                             Text(
//                               '( ${coffeeModel.numRate})',
//                               style: getRegularStyle(
//                                 color: ColorManager.whiteOpacity,
//                                 fontSize: AppSize.s10,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       width: AppSize.s50,
//                     ),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Row(
//                           children: [
//                             Column(
//                               children: [
//                                 SvgPicture.asset(
//                                   ImageAssets.coffeeSvgRepo,
//                                   height: AppSize.s20,
//                                   width: AppSize.s20,
//                                 ),
//                                 const SizedBox(
//                                   height: AppSize.s10,
//                                 ),
//                                 Text(
//                                   'Coffee',
//                                   style: getRegularStyle(
//                                       color: ColorManager.lightText,
//                                       fontSize: FontSize.s12),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(
//                               width: AppSize.s30,
//                             ),
//                             Column(
//                               children: [
//                                 SvgPicture.asset(
//                                   ImageAssets.dropSvgRepo,
//                                   height: AppSize.s20,
//                                   width: AppSize.s20,
//                                 ),
//                                 const SizedBox(
//                                   height: AppSize.s10,
//                                 ),
//                                 Text(
//                                   'Chocolate',
//                                   style: getRegularStyle(
//                                     color: ColorManager.lightText,
//                                     fontSize: FontSize.s12,
//                                   ),
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),
//                         Text(
//                           'Medium Roasted',
//                           style: getMediumStyle(
//                             color: ColorManager.white,
//                             fontSize: FontSize.s12,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
