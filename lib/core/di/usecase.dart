import 'package:ostad/domain/use_cases/add_product.dart';
import 'package:ostad/domain/use_cases/delete_product.dart';
import 'package:ostad/domain/use_cases/get_cart.dart';
import 'package:ostad/domain/use_cases/update_product.dart';

import 'injection_container.dart';

Future<void> initUseCase()async{
  sl.registerLazySingleton<GetCartUseCase>(()=> GetCartUseCase(sl.call()));
  sl.registerLazySingleton<AddProductUseCase>(()=> AddProductUseCase(sl.call()));
  sl.registerLazySingleton<UpdateProductUseCase>(()=> UpdateProductUseCase(sl.call()));
  sl.registerLazySingleton<DeleteProductUseCase>(()=> DeleteProductUseCase(sl.call()));
}