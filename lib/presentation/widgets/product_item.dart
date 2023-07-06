import 'package:flutter/material.dart';
import 'package:grow_it_green/domain/products_repository/models/models.dart';
import 'package:grow_it_green/presentation/cart/provider/cart_provider.dart';
import 'package:grow_it_green/presentation/products/provider/product.dart';
import 'package:grow_it_green/presentation/products/provider/products_provider.dart';
import 'package:grow_it_green/presentation/products/view/product_detail_view.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // ProductItem(this.id, this.title, this.imageUrl);

  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            icon: Icon(
              product.isFavorite ? Icons.favorite : Icons.favorite_border,
            ),
            color: Theme.of(context).accentColor,
            onPressed: () {
              product.toggleFavoriteStatus();
            },
          ),
          title: Text(
            product.name,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: const Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {
              print("item added id: ${product.id.toString()}");
              cart.addItem(
                product.id.toString(), //for increment of existing product
                product.id.toString(), //for new product
                product.price!,
                product.name,
              );
            },
            color: Theme.of(context).accentColor,
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.image!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
