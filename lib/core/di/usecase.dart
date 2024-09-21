import 'package:ostad/domain/use_cases/get_cart.dart';

import 'injection_container.dart';

Future<void> initUseCase()async{
  sl.registerLazySingleton<GetCartUseCase>(()=> GetCartUseCase(sl.call()));
}