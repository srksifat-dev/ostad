import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ostad/core/bloc/global_bloc_providers.dart';
import 'package:ostad/data/models/get_cart_response.dart';
import 'package:ostad/domain/entities/cart_entity.dart';
import 'package:ostad/presentation/bloc/cart_bloc.dart';
import 'package:ostad/presentation/bloc/cart_event.dart';
import 'package:uuid/uuid.dart';

class UpdateCartProductScreen extends StatefulWidget {
  final CartModel cart;
  const UpdateCartProductScreen({required this.cart, super.key});

  @override
  State<UpdateCartProductScreen> createState() => _UpdateCartProductScreenState();
}

class _UpdateCartProductScreenState extends State<UpdateCartProductScreen> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController productCodeController = TextEditingController();
  TextEditingController imgUrlController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController totalPriceController = TextEditingController();
  TextEditingController unitPriceController = TextEditingController();

  @override
  void initState() {
    productNameController.text = widget.cart.productName!;
    productCodeController.text = widget.cart.productCode!;
    imgUrlController.text = widget.cart.imgUrl!;
    unitPriceController.text = widget.cart.unitPrice.toString();
    quantityController.text = widget.cart.quantity.toString();
    totalPriceController.text = widget.cart.totalPrice.toString();
  }

  @override
  void dispose() {
    super.dispose();
    productNameController.dispose();
    productCodeController.dispose();
    imgUrlController.dispose();
    quantityController.dispose();
    totalPriceController.dispose();
    unitPriceController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add to Cart"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: productNameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                labelText: "Product Name",
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: productCodeController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                labelText: "Product Code",
              ),
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: imgUrlController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                labelText: "Image Url",
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: unitPriceController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      labelText: "Unit Price",
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (val) {
                      setState(() {
                        totalPriceController.text = (double.parse(val) *
                            double.parse(quantityController.text))
                            .toString();
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: TextFormField(
                    controller: quantityController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      labelText: "Quantity",
                    ),
                    keyboardType: TextInputType.number,
                    onChanged: (val) {
                      totalPriceController.text = (double.parse(val) *
                          double.parse(unitPriceController.text))
                          .toString();
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            TextFormField(
              readOnly: true,
              controller: totalPriceController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                labelText: "Total Price",
              ),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  print(widget.cart.cartID);
                  BlocProvider.of<CartBloc>(context).add(
                    UpdateCartEvent(
                      cart: CartModel(
                        sId: widget.cart.cartID,
                        productName: productNameController.text,
                        productCode: productCodeController.text,
                        img: imgUrlController.text,
                        unitPrice: unitPriceController.text,
                        qty: quantityController.text,
                        totalPrice: totalPriceController.text,),
                    ),
                  );
                  Navigator.pop(context);
                },
                child: Text("Update Cart"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
