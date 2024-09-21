import 'package:dio/dio.dart';
import 'package:ostad/data/data_source/cart_datasource.dart';

import 'injection_container.dart';

Future<void> initDataSources()async{
  sl.registerSingleton<Dio>(Dio());
  sl.registerLazySingleton<CartDataSource>(()=> CartDataSource(sl.call()));
}