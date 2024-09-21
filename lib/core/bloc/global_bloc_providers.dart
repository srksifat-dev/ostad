import 'package:flutter_bloc/flutter_bloc.dart';
import '../di/injection_container.dart' as di;
import 'package:ostad/presentation/bloc/cart_bloc.dart';
import 'package:ostad/presentation/bloc/cart_event.dart';

class GlobalBlocProviders{
  dynamic providers = [
    BlocProvider(create: (_)=> di.sl<CartBloc>()..add(GetCartEvent())),
  ];
}