import 'package:flutter/material.dart';
import 'package:grow_it_green/data/helpers/api_client.dart';
import 'package:grow_it_green/data/products_api/api.dart';
import 'package:grow_it_green/domain/products_repository/repository.dart';
import 'package:grow_it_green/presentation/home/provider/home_provider.dart';
import 'package:grow_it_green/presentation/plant_encyclopedia/view/plant_encyclopedia_overview_view.dart';
import 'package:grow_it_green/presentation/products/view/products_overview_view.dart';
import 'package:grow_it_green/presentation/services/view/services_overview_view.dart';
import 'package:grow_it_green/presentation/utils/widgets/api_state_widgets/api_state_widget.dart';
import 'package:grow_it_green/presentation/widgets/horizontal_card_list_widget.dart';
import 'package:grow_it_green/presentation/widgets/sideDrawerHeader.dart';
import 'package:grow_it_green/presentation/widgets/sideDrawerList.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static Route route() => MaterialPageRoute(
        builder: (context) => const HomeView(),
      );

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(
        productRepository: ProductsRepositoryImpl(
          productApi: ProductApiImpl(client: context.read<APIClient>()),
        ),
      )..getProducts(),
      child: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        title: const Text('Grow It Green'),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              SideDrawerHeader(),
              SideDrawerList(),
            ],
          ),
        ),
      ),
      body: Consumer<HomeProvider>(
        builder: (context, provider, _) {
          return APIStateWidget(
            apiState: provider.productsState,
            emptyErrorMessage: "Not available",
            successWidget: Padding(
              padding: const EdgeInsets.only(left: 4, right: 4),
              child: Column(
                children: [
                  const SizedBox(height: 3),
                  ProductCardList(
                    products: provider.productsState.data ?? [],
                  ),
                  // ServiceSlider(),
                  // EncyclopediaSlider(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProductCardList extends StatelessWidget {
  const ProductCardList({super.key, required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HorizontalCardListHeader(
          title: 'Products',
          onPressedMore: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductsOverviewScreen(),
              ),
            );
          },
        ),
        HorizontalCardList(
          listCards: products
              .map((e) => ListCard(image: e.image, title: e.name))
              .toList(),
        ),
        HorizontalCardListHeader(
          title: 'Services',
          onPressedMore: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ServicesOverviewView(),
              ),
            );
          },
        ),
        HorizontalCardList(
          listCards: products
              .map((e) => ListCard(image: e.image, title: e.name))
              .toList(),
        ),
        HorizontalCardListHeader(
          title: 'Plant Encyclopedia',
          onPressedMore: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PlantEncyclopediaOverviewView(),
              ),
            );
          },
        ),
        HorizontalCardList(
          listCards: products
              .map((e) => ListCard(image: e.image, title: e.name))
              .toList(),
        )
      ],
    );
  }
}
