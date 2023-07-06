import 'package:flutter/material.dart';
import 'package:grow_it_green/domain/products_repository/models/product_model.dart';
import 'package:grow_it_green/presentation/products/provider/products_provider.dart';
import 'package:grow_it_green/presentation/widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;

  const ProductsGrid({required this.showFavs, required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductsProvider>(context);
    // final products = showFavs ? productsData.favoriteItems : productsData.items;

    print(products);

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, i) => ProductItem(
        product: productsData.items[i],
        // products[i].id,
        // products[i].title,
        // products[i].imageUrl,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
