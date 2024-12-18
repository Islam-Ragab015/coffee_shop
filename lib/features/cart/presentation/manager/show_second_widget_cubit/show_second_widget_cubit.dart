import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'show_second_widget_state.dart';

class ShowSecondWidgetCubit extends Cubit<ShowSecondWidgetState> {
  ShowSecondWidgetCubit() : super(ShowSecondWidgetInitial());
  bool showSecondContainer = false;
  double _startDragX = 0;
  double _endDragX = 0;
  double _velocity = 0;


  void Function(DragStartDetails)? onHorizontalDragStart(details) {
    _startDragX = details.localPosition.dx;
    return null;
  }
  void onHorizontalDragUpdate(DragUpdateDetails details) {
    _endDragX = details.localPosition.dx;
    _velocity = (_endDragX - _startDragX) / details.primaryDelta!;

    if (_velocity > 50) {
      showSecondContainer = true;
      emit(ShowSecondContainer());
    } else if (_velocity < -50) {
      showSecondContainer = false;
      emit(ShowSecondContainer());
    }
  }


}
