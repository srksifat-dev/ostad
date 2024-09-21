
import 'package:ostad/data/models/cart_response.dart';
import 'package:ostad/domain/entities/cart_entity.dart';

import '../../core/resources/data_state.dart';

abstract interface class CartRepository{
  Future<DataState<List<CartModel>>> getCarts();
}