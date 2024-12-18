import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../home/data/models/coffee_model.dart';

class FilteredShopCubit extends Cubit<List<CoffeeModel>> {
  final List<CoffeeModel> _shop;
  int _selectedIndex = 0;

  FilteredShopCubit(this._shop) : super(_shop);

  void filterByClassification(String classification, int index) {
    _selectedIndex = index;
    if (classification == 'All') {
      emit(_shop);
    } else {
      emit(_shop
          .where((coffee) => coffee.classification == classification)
          .toList());
    }
  }

  int get selectedIndex => _selectedIndex;
}
