import 'package:ostad/data/models/get_cart_response.dart';
import 'package:ostad/domain/entities/cart_entity.dart';

abstract class CartEvent{
  const CartEvent();
}

class AddCartEvent extends CartEvent{
  final CartModel cart;
  const AddCartEvent({required this.cart});
}

class GetCartEvent extends CartEvent{
  const GetCartEvent();
}

class UpdateCartEvent extends CartEvent{
  final CartModel cart;
  const UpdateCartEvent({required this.cart});
}

class DeleteCartEvent extends CartEvent{
  final CartModel cart;
  const DeleteCartEvent({required this.cart});
}