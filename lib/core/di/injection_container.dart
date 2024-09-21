import 'package:get_it/get_it.dart';
import 'package:ostad/core/di/bloc.dart';
import 'package:ostad/core/di/data_source.dart';
import 'package:ostad/core/di/repository.dart';
import 'package:ostad/core/di/usecase.dart';

final sl = GetIt.instance;

Future<void> init()async{
  await initBlocs();
  await initDataSources();
  await initRepository();
  await initUseCase();
}