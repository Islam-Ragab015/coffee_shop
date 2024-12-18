
import '../../../home/data/models/coffee_model.dart';

class CartItemModel {
  final CoffeeModel coffee;
  String size;
  int quantity;

  CartItemModel({
    required this.coffee,
     this.size='M',
    this.quantity=1,
  });
}
