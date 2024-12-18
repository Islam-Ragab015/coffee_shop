import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/home/data/models/coffee_model.dart';
import '../utils/assets_manager.dart';

part 'coffee_state.dart';

class CoffeeCubit extends Cubit<CoffeeState> {
  CoffeeCubit() : super(CoffeeInitial());

  // Coffee shop list (available drinks)
  final List<CoffeeModel> _shop = [
    CoffeeModel(
      title: 'Espresso Pro',
      price: 4.20,
      imagePath: ImageAssets.espressoPro,
      subTitle: 'with Oa t Milk',
      rate: 3.5,
      numRate: 3.098,
      classification: 'Espresso',
    ),
    CoffeeModel(
      title: 'EspressoDark',
      price: 4.60,
      imagePath: ImageAssets.espressoDark,
      subTitle: 'with Milk',
      rate: 2.5,
      numRate: 1.098,
      classification: 'Espresso',
    ),
    CoffeeModel(
      title: 'latte',
      price: 15.0,
      imagePath: ImageAssets.latte,
      subTitle: '',
      rate: 4.3,
      numRate: 5.098,
      classification: 'Latte',
    ),
    CoffeeModel(
      title: 'iced latte',
      price: 20.0,
      imagePath: ImageAssets.icedLatte,
      subTitle: '',
      rate: 4.9,
      numRate: 9.098,
      classification: 'Latte',
    ),
    CoffeeModel(
      title: 'espresso',
      price: 30.0,
      imagePath: ImageAssets.espressoPro,
      subTitle: '',
      rate: 5.0,
      numRate: 9.998,
      classification: 'Espresso',
    ),
    CoffeeModel(
      title: 'orange coffee',
      price: 40.0,
      imagePath: ImageAssets.orangeCoffee,
      subTitle: '',
      rate: 3.7,
      numRate: 4.098,
      classification: 'Cappuccino',
    ),
  ];

  // User's cart (items selected by the user)
  final List<CoffeeModel> _userCart = [];

  // User's cart (items selected by the user)

  // Getter for coffee shop list (returns the available drinks)
  List<CoffeeModel> get coffeeShop => _shop;

  // Getter for user's cart (returns items added to cart)
  List<CoffeeModel> get userCurt => _userCart;

  // favorite section
  final List<CoffeeModel> _userFavorite = [];

  List<CoffeeModel> get userFavorite => _userFavorite;

  // Add item to the user's Favorite
  void addItemToFavorite(CoffeeModel cartItem) {
    if (!_userFavorite.contains(cartItem)) {
      _userFavorite.add(cartItem);
      emit(CoffeeAddItemToFavorite());
    }
  }

  bool isFavorite(CoffeeModel coffeeItem) {
    return _userFavorite.contains(coffeeItem);
  }

  void removeItemFromFavorite(CoffeeModel cartItem) {
    _userFavorite.remove(cartItem);
    emit(CoffeeDeleteFromFavorite());
  }

  // Remove all item from the user's cart
  void clearFavorite() {
    userFavorite.clear();
    emit(CoffeeClearFavorite());
  }

  // cart section
  // Add item to the user's cart
  void addItemToCart(CoffeeModel cartItem) {
    CoffeeModel newCartItem = CoffeeModel(
      title: cartItem.title,
      price: cartItem.price,
      imagePath: cartItem.imagePath,
      size: selectedSize,
      type: selectedType,
      quantity: cartItem.quantity,
      subTitle: cartItem.subTitle,
      rate: cartItem.rate,
      numRate: cartItem.numRate,
      isSelected: cartItem.isSelected,
      classification: cartItem.classification,
    );

    _userCart.add(newCartItem);
    calculateTotalPrice();
    refreshDetails();
    emit(CoffeeAddItemToCart());
  }

  // Remove item from the user's cart
  void removeItemFromCart(CoffeeModel cartItem) {
    _userCart.remove(cartItem);
    calculateTotalPrice();
    emit(CoffeeDeleteFromCurt());
  }

  // Remove all item from the user's cart
  void clearCart() {
    userCurt.clear();
    calculateTotalPrice();
    emit(CoffeeClearCurt());
  }

  int quantity = 1;

  void incrementItemQuantity(CoffeeModel cartItem) {
    if (cartItem.quantity < 10) {
      cartItem.quantity += 1;
      calculateTotalPrice();
      emit(CoffeeIncrementCountDrinks());
    }
  }

  void decrementItemQuantity(CoffeeModel cartItem) {
    if (cartItem.quantity > 1) {
      cartItem.quantity -= 1;
      calculateTotalPrice();
      emit(CoffeeDecrementCountDrinks());
    }
  }

  // Change the size of the selected drink
  String selectedSize = 'M'; // Default size is Medium (M)
  String selectedType = 'White Chocolate'; // Default type is White Chocolate

  void changeSelectedSize({required String newSize}) {
    selectedSize = newSize;
    emit(CoffeeChangeSelectedSize());
  }

  void changeSelectedType({required String newType}) {
    selectedType = newType;
    emit(CoffeeChangeSelectedType());
  }

  void selectedItemCart(int index) {
    _userCart[index].isSelected = !_userCart[index].isSelected;
    emit(CurtSelectItem());
  }

  // Refresh drink details
  void refreshDetails() {
    selectedSize = 'M';
    selectedType = 'White Chocolate';

    emit(CoffeeRefreshDetailsDrink());
  }

  // Calculate total price for items in the user's cart, considering size
  double totalPrice = 0.0;

  void calculateTotalPrice() {
    totalPrice = 0.0;
    for (var item in _userCart) {
      double itemPrice = item.price;

      if (item.size == 'S') {
        itemPrice *= 0.80; // 20% discount for small size
      } else if (item.size == 'L') {
        itemPrice *= 1.20; // 20% increase for large size
      }

      totalPrice += itemPrice * item.quantity;
    }
    emit(CoffeeCalculateTotalSale());
  }
}
