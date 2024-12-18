import 'package:coffee_shop/core/utils/styles_manager.dart';
import 'package:coffee_shop/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

import 'color_manager.dart';

class ThemeManager {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: ColorManager.lightBeige,
    scaffoldBackgroundColor: ColorManager.whiteOpacity,
    primaryColorLight: ColorManager.lightBeige,
    primaryColorDark: ColorManager.darkBlue,
    disabledColor: ColorManager.grey,
    splashColor: ColorManager.brownShade,
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),
    iconTheme: IconThemeData(
      color: ColorManager.black,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.brownShade,
      elevation: AppSize.s4,
      shadowColor: ColorManager.brownShade,
      titleTextStyle: getRegularStyle(
        fontSize: AppSize.s16,
        color: ColorManager.white,
      ),
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: ColorManager.brownShade,
    ),
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.grey,
      buttonColor: ColorManager.brownShade,
      splashColor: ColorManager.brownShade,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        textStyle:
            getRegularStyle(color: ColorManager.white, fontSize: AppSize.s16),
        backgroundColor: ColorManager.brownShade,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.s12),
        ),
      ),
    ),
    textTheme: TextTheme(
      displayLarge:
          getSemiBoldStyle(color: ColorManager.black, fontSize: AppSize.s16),
      headlineLarge:
          getSemiBoldStyle(color: ColorManager.black, fontSize: AppSize.s16),
      headlineMedium:
          getRegularStyle(color: ColorManager.black, fontSize: AppSize.s16),
      titleMedium:
          getMediumStyle(color: ColorManager.black, fontSize: AppSize.s16),
      titleSmall:
          getRegularStyle(color: ColorManager.black, fontSize: AppSize.s16),
      bodyLarge:
          getRegularStyle(color: ColorManager.black, fontSize: AppSize.s16),
      bodySmall:
          getRegularStyle(color: ColorManager.black, fontSize: AppSize.s16),
      bodyMedium:
          getRegularStyle(color: ColorManager.black, fontSize: AppSize.s16),
      labelSmall:
          getBoldStyle(color: ColorManager.brownShade, fontSize: AppSize.s16),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle:
          getRegularStyle(color: ColorManager.grey, fontSize: AppSize.s16),
      labelStyle:
          getMediumStyle(color: ColorManager.grey, fontSize: AppSize.s16),
      errorStyle: getRegularStyle(color: ColorManager.error),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.brownShade, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.brownShade, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorManager.brownShade,
      selectedIconTheme: IconThemeData(
        color: ColorManager.black,
        size: AppSize.s30,
      ),
      selectedLabelStyle: TextStyle(color: ColorManager.black),
      selectedItemColor: ColorManager.black,
      unselectedIconTheme: IconThemeData(
        color: ColorManager.black,
        size: AppSize.s30,
      ),
      unselectedItemColor: ColorManager.black,
      unselectedLabelStyle: TextStyle(color: ColorManager.black),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: ColorManager.darkBlue,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: ColorManager.darkBlue,
    cardTheme: CardTheme(
      color: ColorManager.darkBrown,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.darkBlue,
      elevation: AppSize.s4,
      shadowColor: ColorManager.darkBlue,
      titleTextStyle:
          getRegularStyle(fontSize: AppSize.s16, color: ColorManager.white),
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: ColorManager.darkBlue,
    ),
    textTheme: TextTheme(
      displayLarge:
          getSemiBoldStyle(color: ColorManager.white, fontSize: AppSize.s16),
      headlineLarge:
          getSemiBoldStyle(color: ColorManager.white, fontSize: AppSize.s16),
      headlineMedium:
          getRegularStyle(color: ColorManager.white, fontSize: AppSize.s16),
      titleMedium:
          getMediumStyle(color: ColorManager.white, fontSize: AppSize.s16),
      titleSmall:
          getRegularStyle(color: ColorManager.white, fontSize: AppSize.s16),
      bodyLarge:
          getRegularStyle(color: ColorManager.white, fontSize: AppSize.s16),
      bodySmall:
          getRegularStyle(color: ColorManager.white, fontSize: AppSize.s16),
      bodyMedium:
          getRegularStyle(color: ColorManager.white, fontSize: AppSize.s16),
      labelSmall:
          getBoldStyle(color: ColorManager.darkBlue, fontSize: AppSize.s16),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      hintStyle:
          getRegularStyle(color: ColorManager.white, fontSize: AppSize.s16),
      labelStyle:
          getMediumStyle(color: ColorManager.white, fontSize: AppSize.s16),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.white, width: AppSize.s1_5),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),
    ),
    iconTheme: IconThemeData(
      color: ColorManager.white,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorManager.darkBlue,
      selectedIconTheme: IconThemeData(
        color: ColorManager.white,
        size: AppSize.s30,
      ),
      selectedLabelStyle: TextStyle(color: ColorManager.white),
      selectedItemColor: ColorManager.white,
      unselectedIconTheme: IconThemeData(
        color: ColorManager.white,
        size: AppSize.s30,
      ),
      unselectedItemColor: ColorManager.white,
      unselectedLabelStyle: TextStyle(color: ColorManager.white),
    ),
  );
}
