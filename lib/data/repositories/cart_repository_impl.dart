import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ostad/core/failure/failures.dart';
import 'package:ostad/core/resources/data_state.dart';
import 'package:ostad/data/data_source/cart_datasource.dart';
import 'package:ostad/data/models/cart_response.dart';
import 'package:ostad/domain/entities/cart_entity.dart';
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
      print(img);
      await cartDataSource.addProduct(
        img: img,
        productCode: productCode,
        productName: productName,
        qty: qty,
        totalPrice: totalPrice,
        unitPrice: unitPrice,
      );
    } on DioException catch (error) {
      print(error);
    }
  }
}
