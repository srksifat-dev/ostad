import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ostad/presentation/bloc/cart_event.dart';
import 'package:ostad/presentation/pages/add_to_cart_screen.dart';
import 'package:ostad/presentation/widgets/item_card.dart';

import '../bloc/cart_bloc.dart';
import '../bloc/cart_state.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const AddToCartScreen()));
        },
        child: const Icon(Icons.add),
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CartError) {
            return Center(
              child: Text(state.message),
            );
          }
          if (state is CartLoaded) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: state.carts.length,
                      itemBuilder: (context, index) {
                        return itemCard(context: context, cart: state.carts[index]);
                      },
                      separatorBuilder: (_, __) => const SizedBox(
                        height: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  FilledButton(
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.red),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                              "Congratulations! You have checkout successfully.")));
                    },
                    child: const Center(
                      child: Text("CHECK OUT"),
                    ),
                  ),
                ],
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        "My Bag",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        IconButton(onPressed: (){
          BlocProvider.of<CartBloc>(context).add(
            const GetCartEvent()
          );
        }, icon: const Icon(Icons.refresh))
      ],
      centerTitle: false,
    );
  }
}
