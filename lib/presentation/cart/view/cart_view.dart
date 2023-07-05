import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:grow_it_green/presentation/cart/provider/cart_provider.dart'
    show CartProvider;
import 'package:grow_it_green/presentation/cart/view/check_out_product_view.dart';
import 'package:grow_it_green/presentation/orders/provider/orders_provider.dart';
import 'package:grow_it_green/presentation/widgets/cart_item_widget.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  const Spacer(),
                  Chip(
                    label: Text(
                      'Rs.${cart.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                        color:
                            Theme.of(context).primaryTextTheme.headline6?.color,
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  TextButton(
                    onPressed: () async {
                      Provider.of<OrdersProvider>(context, listen: false)
                          .addOrder(
                        cart.items.values.toList(),
                        cart.totalAmount,
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CheckOutProductView(),
                        ),
                      );
                      // print(
                      //   cart.items.values.map((e) => e.toJson()).toList(),
                      // );
                      // print(cart.itemCount);
                      // print(cart.items);
                      // print(cart.totalAmount);
                    },
                    child: const Text('ORDER NOW'),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) => CartItemWidget(
                id: cart.items.values.toList()[i].id,
                price: cart.items.values.toList()[i].price,
                productId: cart.items.keys.toList()[i],
                quantity: cart.items.values.toList()[i].quantity,
                title: cart.items.values.toList()[i].title,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
