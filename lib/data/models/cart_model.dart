import 'package:ostad/data/models/product_model.dart';

class CartModel{
  final String cartID;
  final ProductModel product;
  int quantity;
  final String selectedColor;
  final String selectedSize;

   CartModel({
    required this.cartID,
    required this.product,
    this.quantity = 1,
    required this.selectedColor,
    required this.selectedSize,
  });
}