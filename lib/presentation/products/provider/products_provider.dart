import 'package:flutter/material.dart';
import 'package:grow_it_green/domain/products_repository/models/product_model.dart';
import 'package:grow_it_green/domain/products_repository/repository.dart';

// import 'package:grow_it_green/presentation/products/provider/product.dart';

class ProductsProvider with ChangeNotifier {
  ProductsProvider({required ProductsRepository productsRepository})
      : _productsRepository = productsRepository;

  final ProductsRepository _productsRepository;
  // ignore: prefer_final_fields
  List<Product> _items = [
    // Product(
    //   id: 'p1',
    //   title: 'Money Plant',
    //   description: 'ABC ABC',
    //   price: 290.99,
    //   imageUrl:
    //       'https://firebasestorage.googleapis.com/v0/b/grow-it-green.appspot.com/o/1.png?alt=media&token=f2086ffb-8dae-4cfe-8d29-8125246d724d',
    // ),
    // Product(
    //   id: 'p2',
    //   title: 'Russo Fertilizer',
    //   description: 'Abc Abc',
    //   price: 500,
    //   imageUrl:
    //       'https://firebasestorage.googleapis.com/v0/b/grow-it-green.appspot.com/o/2.png?alt=media&token=5b52b22e-69d2-4b59-b673-dc753863fcbe',
    // ),
    // Product(
    //   id: 'p3',
    //   title: 'Decorated Pot',
    //   description: 'Nice decorated pot.',
    //   price: 199.99,
    //   imageUrl:
    //       'https://firebasestorage.googleapis.com/v0/b/grow-it-green.appspot.com/o/3.png?alt=media&token=3701e796-8ff2-4e4d-b6ba-c19a7201cc1e',
    // ),
  ];
  // var _showFavoritesOnly = false;

  List<Product> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return _items;
  }

  set items(List<Product> prds) {
    _items = prds;
  }

  List<Product> get favoriteItems {
    notifyListeners();
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(int id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }
}
