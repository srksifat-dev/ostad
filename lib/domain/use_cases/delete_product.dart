import 'package:ostad/core/usecase/usecase.dart';
import 'package:ostad/data/models/delete_cart_response.dart';
import 'package:ostad/data/models/get_cart_response.dart';
import 'package:ostad/domain/entities/cart_entity.dart';
import 'package:ostad/domain/repositories/cart_repository.dart';

class DeleteProductUseCase implements UseCase<void, CartModel>{
  final CartRepository cartRepository;

  DeleteProductUseCase(this.cartRepository);

  @override
  Future<DeleteCartResponse?> call({required CartModel cart}) async {
    return cartRepository.deleteProduct(
      id: cart.cartID!,
    );
  }
}