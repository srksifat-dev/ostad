import 'package:ostad/domain/use_cases/add_product.dart';
import 'package:ostad/domain/use_cases/get_cart.dart';

import 'injection_container.dart';

Future<void> initUseCase()async{
  sl.registerLazySingleton<GetCartUseCase>(()=> GetCartUseCase(sl.call()));
  sl.registerLazySingleton<AddProductUseCase>(()=> AddProductUseCase(sl.call()));
}