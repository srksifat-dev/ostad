import 'package:ostad/core/usecase/usecase.dart';
import 'package:ostad/data/models/get_cart_response.dart';
import 'package:ostad/domain/repositories/cart_repository.dart';

class AddProductUseCase implements UseCase<void, CartModel>{
  final CartRepository cartRepository;

  AddProductUseCase(this.cartRepository);

  @override
  Future<void> call({required CartModel cart}) async {
    cartRepository.addProduct(
      totalPrice: cart.totalPrice!,
      unitPrice: cart.unitPrice!,
      productCode: cart.productCode!,
      productName: cart.productName!,
      img: cart.imgUrl!,
      qty: cart.quantity!,
    );
  }


}