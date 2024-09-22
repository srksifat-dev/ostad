import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ostad/core/resources/data_state.dart';
import 'package:ostad/data/data_source/cart_datasource.dart';
import 'package:ostad/data/models/delete_cart_response.dart';
import 'package:ostad/data/models/get_cart_response.dart';
import 'package:ostad/data/models/update_cart_response.dart';
import 'package:ostad/domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartDataSource cartDataSource;

  CartRepositoryImpl(this.cartDataSource);

  @override
  Future<DataState<List<CartModel>>> getCarts() async {
    try {
      final httpResponse = await cartDataSource.getCarts();

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
          requestOptions: httpResponse.response.requestOptions,
          response: httpResponse.response,
          error: httpResponse.response.statusMessage,
          type: DioExceptionType.badResponse,
        ));
      }
    } on DioException catch (error) {
      return DataFailed(error);
    }
  }

  @override
  Future<void> addProduct({
    required String img,
    required String productCode,
    required String productName,
    required String qty,
    required String totalPrice,
    required String unitPrice,
  }) async {
    try {
      await cartDataSource.addProduct(
        img: img,
        productCode: productCode,
        productName: productName,
        qty: qty,
        totalPrice: totalPrice,
        unitPrice: unitPrice,
      );
    } on DioException {
    }
  }

  @override
  Future<UpdateCartResponse?> updateProduct({
    required String id,
    required String img,
    required String productCode,
    required String productName,
    required String qty,
    required String totalPrice,
    required String unitPrice,
  }) async {
    UpdateCartResponse? response;
    try {
      response = await cartDataSource.updateProduct(
        id: id,
        img: img,
        productCode: productCode,
        productName: productName,
        qty: qty,
        totalPrice: totalPrice,
        unitPrice: unitPrice,
      );
      return response;
    } on DioException {
    }
    return response;
  }

  @override
  Future<DeleteCartResponse?> deleteProduct({
    required String id,
  }) async {
    DeleteCartResponse? response;
    try {
      response = await cartDataSource.deleteProduct(id: id);
    } on DioException {
    }
    return response;
  }
}
