import 'package:ostad/data/models/cart_response.dart';
import 'package:ostad/domain/entities/cart_entity.dart';

import '../../core/resources/data_state.dart';

abstract interface class CartRepository {
  Future<dynamic> addProduct({
    required String img,
    required String productCode,
    required String productName,
    required String qty,
    required String totalPrice,
    required String unitPrice,
  });

  Future<DataState<List<CartEntity>>> getCarts();
}
