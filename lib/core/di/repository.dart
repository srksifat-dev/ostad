import 'package:ostad/data/repositories/cart_repository_impl.dart';
import 'package:ostad/domain/repositories/cart_repository.dart';

import 'injection_container.dart';

Future<void> initRepository()async{
  sl.registerLazySingleton<CartRepository>(()=>CartRepositoryImpl(sl.call()));
}