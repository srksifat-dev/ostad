import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if(state is CartLoading){
            return const Center(child: CircularProgressIndicator(),);
          }
          if(state is CartError){
            return Center(child: Text("Empty Cart!"),);
          }
          if (state is CartLoaded){
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: state.carts.length,
                    itemBuilder: (context, index) {
                      return itemCard(cart: state.carts[index]);
                    },
                    separatorBuilder: (_, __) =>
                        SizedBox(
                          height: 16,
                        ),
                  ),
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
          );}

          return const SizedBox.shrink();
        },
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
