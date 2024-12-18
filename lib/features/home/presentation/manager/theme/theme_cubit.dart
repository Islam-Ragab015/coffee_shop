import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/theme_manager.dart';



class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(ThemeManager.lightTheme);

  void toggleTheme() {
    emit(state.brightness == Brightness.dark
        ? ThemeManager.lightTheme
        : ThemeManager.darkTheme);
  }
}
