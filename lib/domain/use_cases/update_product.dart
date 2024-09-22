import 'package:ostad/core/usecase/usecase.dart';
import 'package:ostad/data/models/get_cart_response.dart';
import 'package:ostad/data/models/update_cart_response.dart';
import 'package:ostad/domain/repositories/cart_repository.dart';

class UpdateProductUseCase implements UseCase<void, CartModel>{
  final CartRepository cartRepository;

  UpdateProductUseCase(this.cartRepository);

  @override
  Future<UpdateCartResponse?> call({required CartModel cart}) async {
    return cartRepository.updateProduct(
      id: cart.cartID!,
      totalPrice: cart.totalPrice!,
      unitPrice: cart.unitPrice!,
      productCode: cart.productCode!,
      productName: cart.productName!,
      img: cart.imgUrl!,
      qty: cart.quantity!,
    );
  }
}