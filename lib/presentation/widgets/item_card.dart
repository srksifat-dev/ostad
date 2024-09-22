import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ostad/domain/entities/cart_entity.dart';
import 'package:ostad/presentation/bloc/cart_event.dart';
import 'package:ostad/presentation/bloc/cart_state.dart';
import 'package:ostad/presentation/pages/update_cart_product.dart';

import '../../data/models/get_cart_response.dart';
import '../bloc/cart_bloc.dart';

Widget itemCard({required BuildContext context, required CartModel cart}) {
  return SizedBox(
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: cart.imgUrl != null
                  ? Image.network(
                      cart.imgUrl!,
                      width: 100,
                errorBuilder: (_,__,___)=>Icon(Icons.image,size: 100,),
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
                SizedBox(
                  width: 100,
                  child: Text(
                    cart.productName!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
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
                    SizedBox(
                        width: 40,
                        child: Text(cart.quantity.toString(),overflow: TextOverflow.ellipsis,)),
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
                SizedBox(height: 16,),
                Text("Total Price: ${cart.totalPrice}"),
              ],
            ),
            Spacer(),
            SizedBox(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      IconButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> UpdateCartProductScreen(cart: cart)));
                      }, icon: Icon(Icons.edit)),
                      IconButton(onPressed: (){
                        BlocProvider.of<CartBloc>(context).add(
                          DeleteCartEvent(
                            cart: cart,
                          ),
                        );
                      }, icon: Icon(Icons.delete)),
                    ],
                  ),
                  SizedBox(
                    width: 60,
                    child: Text(
                      "${cart.totalPrice ?? "0"}\$",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
