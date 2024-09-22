import 'package:ostad/presentation/bloc/cart_bloc.dart';

import 'injection_container.dart';

Future<void> initBlocs() async {
  sl.registerFactory<CartBloc>(
    () => CartBloc(
      getCartUseCase: sl.call(),
      addProductUseCase: sl.call(),
      updateProductUseCase: sl.call(),
      deleteProductUseCase: sl.call()
    ),
  );
}
