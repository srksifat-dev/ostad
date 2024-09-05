import 'package:flutter/material.dart';

import '../../data/data_source/dummy_carts.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double totalAmount = 0;

  // Calculate total amount
  double getTotalAmount() {
    double total = 0.0;
    for (var item in carts) {
      total += item.product.price * item.quantity;
    }
    return total;
  }

  // Increase quantity of an item
  void increaseQuantity(int index) {
    setState(() {
      carts[index].quantity++;
    });
  }

  // Decrease quantity of an item
  void decreaseQuantity(int index) {
    setState(() {
      if (carts[index].quantity > 1) {
        carts[index].quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    getTotalAmount();
    return Scaffold(
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: carts.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 120,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.network(
                                carts[index].product.productImgUrl,
                                width: 100,
                              ),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  carts[index].product.productTitle,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Row(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "Color: ",
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                          TextSpan(
                                            text: carts[index].selectedColor,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "Size: ",
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                          TextSpan(
                                            text: carts[index].selectedSize,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        decreaseQuantity(index);
                                        getTotalAmount();
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        child: Center(
                                          child: Icon(Icons.remove),
                                        ),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(32),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black12,
                                                offset: Offset(1, 1),
                                                blurRadius: 5,
                                              ),
                                            ]),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Text(carts[index].quantity.toString()),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        increaseQuantity(index);
                                        getTotalAmount();
                                      },
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        child: Center(
                                          child: Icon(Icons.add),
                                        ),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(32),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black12,
                                                offset: Offset(1, 1),
                                                blurRadius: 5,
                                              ),
                                            ]),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Spacer(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.more_vert,
                                ),
                                Text(
                                  "${(carts[index].quantity * carts[index].product.price).toStringAsFixed(0)}\$",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, __) => SizedBox(
                  height: 16,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total Amount:"),
                Text(
                  "${getTotalAmount().toStringAsFixed(0)}\$",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            FilledButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(Colors.red),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                        "Congratulations! You have checkout successfully.")));
              },
              child: Center(
                child: Text("CHECK OUT"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        "My Bag",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: false,
    );
  }
}
