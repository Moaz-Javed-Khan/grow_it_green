part of 'repository.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  ProductsRepositoryImpl({
    required ProductApi productApi,
  }) : _api = productApi;

  final ProductApi _api;

  @override
  Future<List<Product>> getProducts() async {
    final response = await _api.getProducts();

    return response.map((e) => Product.fromEntity(e)).toList();
  }
}
