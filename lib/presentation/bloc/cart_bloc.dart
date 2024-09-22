import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ostad/core/constants/strings.dart';
import 'package:ostad/core/resources/data_state.dart';
import 'package:ostad/domain/use_cases/add_product.dart';
import 'package:ostad/domain/use_cases/delete_product.dart';
import 'package:ostad/domain/use_cases/get_cart.dart';
import 'package:ostad/domain/use_cases/update_product.dart';
import 'package:ostad/presentation/bloc/cart_event.dart';

import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetCartUseCase getCartUseCase;
  final AddProductUseCase addProductUseCase;
  final UpdateProductUseCase updateProductUseCase;
  final DeleteProductUseCase deleteProductUseCase;

  CartBloc({
    required this.getCartUseCase,
    required this.addProductUseCase,
    required this.updateProductUseCase,
    required this.deleteProductUseCase,
  }) : super(CartInitialState()) {
    on<GetCartEvent>(onGetCarts);
    on<AddCartEvent>(onAddCart);
    on<UpdateCartEvent>(onUpdateCart);
    on<DeleteCartEvent>(onDeleteCart);
  }

  Future<void> onAddCart(
    AddCartEvent event,
    Emitter<CartState> emit,
  ) async {
    try {
      emit(const CartLoading());
      await addProductUseCase(cart: event.cart);
      final dataState = await getCartUseCase();

      if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
        emit(CartLoaded(carts: dataState.data!));
      }
      if (dataState is DataFailed) {
        emit(CartError(message: dataState.error!.toString()));
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> onGetCarts(
    GetCartEvent event,
    Emitter<CartState> emit,
  ) async {
    try {
      emit(const CartLoading());
      final dataState = await getCartUseCase();
      if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
        emit(CartLoaded(carts: dataState.data!));
      }
      if (dataState is DataFailed) {
        emit(CartError(message: dataState.error!.toString()));
      }
    } catch (e) {}
  }

  Future<void> onUpdateCart(
    UpdateCartEvent event,
    Emitter<CartState> emit,
  ) async {
    try {
      emit(const CartLoading());
      var response = await updateProductUseCase(cart: event.cart);
      if (response?.status! == "success"){
        final dataState = await getCartUseCase();

        if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
          emit(CartLoaded(carts: dataState.data!));
        }
        if (dataState is DataFailed) {
          emit(CartError(message: dataState.error!.toString()));
        }
      }

    } catch (e) {
      print(e);
    }
  }

  Future<void> onDeleteCart(
    DeleteCartEvent event,
    Emitter<CartState> emit,
  ) async {
    try {
      emit(const CartLoading());
      var response = await deleteProductUseCase(cart: event.cart);
      if(response!.status == "success"){
        final dataState = await getCartUseCase();

        if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
          emit(CartLoaded(carts: dataState.data!));
        }
        if (dataState is DataFailed) {
          emit(CartError(message: dataState.error!.toString()));
        }
      }

    } catch (e) {
      print(e);
    }
  }
}
