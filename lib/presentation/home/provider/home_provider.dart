import 'package:flutter/foundation.dart';
import 'package:grow_it_green/_common/helpers/custom_exception.dart';
import 'package:grow_it_green/domain/plant_encyclopedias_repository/repository.dart';
import 'package:grow_it_green/domain/products_repository/repository.dart';
import 'package:grow_it_green/domain/services_repository/repository.dart';
import 'package:grow_it_green/presentation/utils/helpers/api_state.dart';

class HomeProvider with ChangeNotifier {
  HomeProvider({
    required ProductsRepository productRepository,
    required ServicesRepository serviceRepository,
    required PlantEncyclopediasRepository plantEncyclopediaRepository,
  })  : _productRepository = productRepository,
        _serviceRepository = serviceRepository,
        _plantEncyclopediaRepository = plantEncyclopediaRepository;

  final ProductsRepository _productRepository;
  final ServicesRepository _serviceRepository;
  final PlantEncyclopediasRepository _plantEncyclopediaRepository;

  APIState<List<Product>> productsState = const APIState<List<Product>>();
  APIState<List<Service>> servicesState = const APIState<List<Service>>();
  APIState<List<PlantEncyclopedia>> plantEncyclopediasState =
      const APIState<List<PlantEncyclopedia>>();

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

  Future<void> getServices() async {
    servicesState = servicesState.toLoading();
    notifyListeners();

    try {
      final response = await _serviceRepository.getServices();
      servicesState = servicesState.toLoaded(data: response);
    } on CustomException catch (e) {
      servicesState = servicesState.toFailure(e.message);
    } catch (e) {
      servicesState = servicesState.toFailure('Something went wrong!');
    }

    notifyListeners();
  }

  Future<void> getPlantEncyclopedia() async {
    plantEncyclopediasState = plantEncyclopediasState.toLoading();
    notifyListeners();

    try {
      final response =
          await _plantEncyclopediaRepository.getPlantEncyclopedias();
      plantEncyclopediasState =
          plantEncyclopediasState.toLoaded(data: response);
    } on CustomException catch (e) {
      plantEncyclopediasState = plantEncyclopediasState.toFailure(e.message);
    } catch (e) {
      plantEncyclopediasState =
          plantEncyclopediasState.toFailure('Something went wrong!');
    }

    notifyListeners();
  }
}
