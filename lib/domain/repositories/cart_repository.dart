import 'package:ostad/data/models/delete_cart_response.dart';
import 'package:ostad/data/models/get_cart_response.dart';
import 'package:ostad/data/models/update_cart_response.dart';
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

  Future<DataState<List<CartModel>>> getCarts();

  Future<UpdateCartResponse?> updateProduct({
    required String id,
    required String img,
    required String productCode,
    required String productName,
    required String qty,
    required String totalPrice,
    required String unitPrice,
  });

  Future<DeleteCartResponse?> deleteProduct({
    required String id,
});
}
