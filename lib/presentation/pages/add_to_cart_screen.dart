import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ostad/data/models/get_cart_response.dart';
import 'package:ostad/presentation/bloc/cart_bloc.dart';
import 'package:ostad/presentation/bloc/cart_event.dart';

class AddToCartScreen extends StatefulWidget {
  const AddToCartScreen({super.key});

  @override
  State<AddToCartScreen> createState() => _AddToCartScreenState();
}

class _AddToCartScreenState extends State<AddToCartScreen> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController productCodeController = TextEditingController();
  TextEditingController imgUrlController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController totalPriceController = TextEditingController();
  TextEditingController unitPriceController = TextEditingController();

  @override
  void initState() {
    super.initState();
    unitPriceController.text = "0";
    quantityController.text = "0";
    totalPriceController.text = "0";
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
        title: const Text("Add to Cart"),
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
            const SizedBox(
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
            const SizedBox(
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
            const SizedBox(
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
                const SizedBox(
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
            const SizedBox(
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
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  BlocProvider.of<CartBloc>(context).add(
                    AddCartEvent(
                      cart: CartModel(
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
                child: const Text("Add to Cart"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
