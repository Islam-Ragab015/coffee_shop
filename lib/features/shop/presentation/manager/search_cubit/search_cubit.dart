import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../home/data/models/coffee_model.dart';

class SearchCubit extends Cubit<List<CoffeeModel>> {
  final List<CoffeeModel> coffeeShop;

  SearchCubit(this.coffeeShop) : super([]);

  void search(String query) {
    print('Search query: $query');
    if (query.isEmpty) {
      emit([]);
      return;
    }
    final searchResults = coffeeShop.where((coffee) {
      return coffee.title.toLowerCase().contains(query.toLowerCase());
    }).toList();
    print('Search results: $searchResults');
    emit(searchResults);
  }

  void clearSearch() {
    emit([]);
  }
}
