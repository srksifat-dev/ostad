import 'package:flutter/material.dart';
import 'package:ostad/domain/entities/cart_entity.dart';
import 'package:ostad/presentation/bloc/cart_state.dart';

import '../../data/models/cart_response.dart';

Widget itemCard({required CartEntity cart}) {
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
              child: cart.imgUrl != null
                  ? Image.network(
                      cart.imgUrl!,
                      width: 100,
                    )
                  : Center(
                      child: Icon(Icons.image),
                    ),
            ),
            SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cart.productName!,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 30,
                        width: 30,
                        child: Center(
                          child: Icon(Icons.remove),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(32),
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
                    Text(cart.quantity.toString()),
                    SizedBox(
                      width: 16,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 30,
                        width: 30,
                        child: Center(
                          child: Icon(Icons.add),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(32),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              offset: Offset(1, 1),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
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
                  "${cart.totalPrice!}\$",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
