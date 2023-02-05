import 'dart:async';

import 'package:grow_it_green/data/products_api/api.dart';
import 'package:grow_it_green/domain/products_repository/models/product_model.dart';

export 'models/models.dart';

part 'products_repository.dart';

abstract class ProductsRepository {
  Future<List<Product>> getProducts();
}
