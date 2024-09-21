import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ostad/core/resources/data_state.dart';
import 'package:ostad/domain/use_cases/get_cart.dart';
import 'package:ostad/presentation/bloc/cart_event.dart';

import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetCartUseCase getCartUseCase;

  CartBloc({required this.getCartUseCase}) : super(CartInitialState()) {
    on<GetCartEvent>(onGetCarts);
  }

  Future<void> onGetCarts(
    GetCartEvent event,
    Emitter<CartState> emit,
  ) async {
    try {
      emit(const CartLoading());
      final dataState = await getCartUseCase();
      if(dataState is DataSuccess && dataState.data!.isNotEmpty){
        emit(
          CartLoaded(carts: dataState.data!)
        );
      }
      if(dataState is DataFailed){
        emit(CartError(message: dataState.error!.toString()));
      }
    } catch (e) {}
  }
}
