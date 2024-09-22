import 'package:ostad/data/models/get_cart_response.dart';

abstract class CartState{
  const CartState();
}

class CartInitialState extends CartState{
  const CartInitialState();
}

class CartLoading extends CartState{
  const CartLoading();
}

class CartLoaded extends CartState{
  final List<CartModel> carts;
  const CartLoaded({required this.carts});
}

class CartError extends CartState{
  final String message;

  CartError({required this.message});
}