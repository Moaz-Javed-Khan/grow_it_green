part of 'api.dart';

class ProductApiImpl extends ProductApi {
  ProductApiImpl({
    required APIClient client,
  }) : _client = client;

  final APIClient _client;

  @override
  Future<List<ProductEntity>> getProducts() async {
    final response =
        await _client.get(handle: ProductEndpoints.products, enableLogs: true);

    return (response as List)
        .map((e) => ProductEntity.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
