import 'package:ostad/core/usecase/usecase.dart';
import 'package:ostad/data/models/get_cart_response.dart';
import 'package:ostad/domain/entities/cart_entity.dart';
import 'package:ostad/domain/repositories/cart_repository.dart';

import '../../core/resources/data_state.dart';

class GetCartUseCase implements UseCase<DataState<List<CartModel>>, void> {
  final CartRepository cartRepository;

  GetCartUseCase(this.cartRepository);

  @override
  Future<DataState<List<CartModel>>> call({void cart}) {
    return cartRepository.getCarts();
  }
}
