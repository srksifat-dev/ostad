import 'package:flutter/cupertino.dart';
import 'package:ostad/data/models/cart_response.dart';
import 'package:ostad/domain/entities/cart_entity.dart';

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
  final List<CartEntity> carts;
  const CartLoaded({required this.carts});
}

class CartError extends CartState{
  final String message;

  CartError({required this.message});
}