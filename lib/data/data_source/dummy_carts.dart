import 'package:ostad/data/data_source/dummy_products.dart';
import 'package:ostad/data/models/cart_model.dart';

List<CartModel> carts = [
  CartModel(cartID: "01", product: products[0], quantity: 1, selectedColor: products[0].availableColors[0], selectedSize: products[0].availableSizes[1],),
  CartModel(cartID: "02", product: products[1], quantity: 1, selectedColor: products[1].availableColors[1], selectedSize: products[1].availableSizes[1],),
  CartModel(cartID: "03", product: products[2], quantity: 1, selectedColor: products[2].availableColors[0], selectedSize: products[2].availableSizes[0],),
];