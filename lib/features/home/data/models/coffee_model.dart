class CoffeeModel {
  final String title;
  final String subTitle;
  final double rate;
  final double numRate;
  final double price;
  final String imagePath;
  final String classification;
  bool isSelected;
  String size;
  String type;
  int quantity;

  CoffeeModel({
    required this.title,
    required this.subTitle,
    required this.rate,
    required this.numRate,
    required this.price,
    required this.imagePath,
    required this.classification,
    this.size = 'M',
    this.type = 'White Chocolate',
    this.quantity = 1,
    this.isSelected = true,
  });

// @override
// String toString() {
//   return 'CoffeeModel{title: $title, price: $price, rate: $rate}';
// }
}
