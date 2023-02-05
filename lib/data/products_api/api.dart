import 'package:grow_it_green/data/helpers/api_client.dart';
import 'package:grow_it_green/data/products_api/config/endpoints.dart';
import 'package:grow_it_green/data/products_api/entities/entities.dart';

part 'products_api.dart';

abstract class ProductApi {
  Future<List<ProductEntity>> getProducts();
}
