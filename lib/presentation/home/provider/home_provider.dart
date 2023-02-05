import 'package:flutter/foundation.dart';
import 'package:grow_it_green/_common/helpers/custom_exception.dart';
import 'package:grow_it_green/domain/products_repository/repository.dart';
import 'package:grow_it_green/presentation/utils/helpers/api_state.dart';

class HomeProvider with ChangeNotifier {
  HomeProvider({
    required ProductsRepository productRepository,
  }) : _productRepository = productRepository;

  final ProductsRepository _productRepository;

  APIState<List<Product>> productsState = const APIState<List<Product>>();

  Future<void> getProducts() async {
    productsState = productsState.toLoading();
    notifyListeners();

    try {
      final response = await _productRepository.getProducts();
      productsState = productsState.toLoaded(data: response);
    } on CustomException catch (e) {
      productsState = productsState.toFailure(e.message);
    } catch (e) {
      productsState = productsState.toFailure('Something went wrong!');
    }

    notifyListeners();
  }
}
