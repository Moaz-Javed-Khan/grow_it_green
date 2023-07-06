import 'package:flutter/material.dart';
import 'package:grow_it_green/presentation/cart/provider/cart_provider.dart';
import 'package:provider/provider.dart';

class CartItemWidget extends StatefulWidget {
  final String id;
  final String productId;
  final num price;
  int quantity;
  final String title;

  CartItemWidget({
    required this.id,
    required this.productId,
    required this.price,
    required this.quantity,
    required this.title,
  });

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  @override
  Widget build(BuildContext context) {
    print("id: ${widget.id}");
    print("Product id: ${widget.productId}");
    final cart = Provider.of<CartProvider>(context);
    return Dismissible(
      key: ValueKey(widget.id),
      background: Container(
        color: Theme.of(context).errorColor,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<CartProvider>(context, listen: false)
            .removeItem(widget.productId);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: FittedBox(
                  child: Text('Rs.${widget.price}'),
                ),
              ),
            ),
            title: Text(widget.title),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total: Rs.${widget.price * widget.quantity}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 10),
                Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Text("Quantity"),
                    const SizedBox(width: 20),
                    InkWell(
                      onTap: () => {
                        cart.incrementQuantity(widget.productId),
                        setState(() {}),
                        print(
                          "after increment Quantity: ${cart.itemQuantity(widget.productId)}",
                        ),
                      },
                      child: const CircleAvatar(
                        child: Icon(Icons.add),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '${cart.itemQuantity(widget.productId)} x',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () => {
                        if (cart.itemQuantity(widget.productId)! <= 1)
                          {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                duration: Duration(milliseconds: 200),
                                content: Text(
                                  "Can't Decrement! Swipe to remove Item",
                                ),
                              ),
                            )
                          }
                        else
                          {
                            cart.decrementQuantity(widget.productId),
                            setState(() {}),
                            print(
                              "after decrement Quantity: ${cart.itemQuantity(widget.productId)}",
                            ),
                          }
                      },
                      // quantityDecrement,
                      child: const CircleAvatar(
                        child: Icon(Icons.remove),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
              ],
            ),
            // trailing: Text('${cart.itemQuantity(widget.productId)} x'),
          ),
        ),
      ),
    );
  }
}
