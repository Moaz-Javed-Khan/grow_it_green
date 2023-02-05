import 'package:flutter/material.dart';
import 'package:grow_it_green/domain/products_repository/models/product_model.dart';
import 'package:grow_it_green/presentation/cart/provider/cart_provider.dart';
import 'package:grow_it_green/presentation/cart/view/cart_view.dart';
import 'package:grow_it_green/presentation/widgets/badge.dart';
import 'package:grow_it_green/presentation/widgets/products_grid.dart';

import 'package:provider/provider.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  // List<Product> products;

  // ProductsOverviewScreen(this.products);
  // static Route route() =>
  //     MaterialPageRoute(builder: (context) => ProductsOverviewScreen(products));

  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;
  // late List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            icon: const Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              const PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.Favorites,
              ),
              const PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.All,
              ),
            ],
          ),
          Consumer<CartProvider>(
            builder: (_, cart, ch) => Badge(
              value: cart.itemCount.toString(),
              color: Colors.white30,
              child: ch as Widget,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      body: ProductsGrid(_showOnlyFavorites),
    );
  }
}
