import 'package:flutter/material.dart';
import 'package:grow_it_green/data/helpers/api_client.dart';
import 'package:grow_it_green/domain/auth_repository/repository.dart';
import 'package:grow_it_green/presentation/app/provider/app_provider.dart';
import 'package:grow_it_green/presentation/app/view/onboarding.dart';
import 'package:grow_it_green/presentation/app/view/splash_view.dart';
import 'package:grow_it_green/presentation/auth/log_in/view/log_in_view.dart';
import 'package:grow_it_green/presentation/cart/provider/cart_provider.dart';
import 'package:grow_it_green/presentation/cart/view/cart_view.dart';
import 'package:grow_it_green/presentation/home/view/homeScreen.dart';
import 'package:grow_it_green/presentation/orders/provider/orders_provider.dart';
import 'package:grow_it_green/presentation/orders/view/orders_view.dart';
import 'package:grow_it_green/presentation/products/provider/products_provider.dart';
import 'package:grow_it_green/presentation/products/view/product_detail_view.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  final AuthRepository _authRepository;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => _authRepository),
        Provider(create: (_) => APIClient(authRepository: _authRepository)),
        ChangeNotifierProvider(
          create: (_) => AppProvider(authRepository: _authRepository),
        ),
        ChangeNotifierProvider.value(
          value: ProductsProvider(),
        ),
        ChangeNotifierProvider.value(
          value: CartProvider(),
        ),
        ChangeNotifierProvider.value(
          value: OrdersProvider(),
        ),
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  late final AppProvider provider;

  @override
  void initState() {
    super.initState();
    provider = context.read<AppProvider>();
    provider.addListener(_onListen);
  }

  void _onListen() {
    if (provider.onboardingStatus == OnboardingStatus.notOnboarded) {
      _navigator.pushAndRemoveUntil<void>(
        Onboarding.route(),
        (route) => false,
      );
    }
    if (provider.onboardingStatus == OnboardingStatus.onboarded) {
      if (provider.authStatus == AuthStatus.authenticated) {
        _navigator.pushAndRemoveUntil<void>(
          HomeView.route(),
          (route) => false,
        );
      } else if (provider.authStatus == AuthStatus.unauthenticated) {
        _navigator.pushAndRemoveUntil<void>(
          LogInView.route(),
          (route) => false,
        );
      }
    }

    // switch (provider.authStatus) {
    //   case AuthStatus.authenticated:
    //     _navigator.pushAndRemoveUntil<void>(
    //       HomeView.route(),
    //       (route) => false,
    //     );
    //     break;
    //   case AuthStatus.unauthenticated:
    //     _navigator.pushAndRemoveUntil<void>(
    //       SignUpView.route(),
    //       (route) => false,
    //     );
    //     break;
    //   case AuthStatus.unknown:
    //     break;
    // }
    // switch (provider.onboardingStatus) {
    //   case OnboardingStatus.onboarded:
    //     _navigator.pushAndRemoveUntil<void>(
    //       LogInView.route(),
    //       (route) => false,
    //     );
    //     break;
    //   case OnboardingStatus.notOnboarded:
    //     _navigator.pushAndRemoveUntil<void>(
    //       Onboarding.route(),
    //       (route) => false,
    //     );
    //     break;
    //   case OnboardingStatus.unknown:
    //     break;
    // }
  }

  @override
  void dispose() {
    provider.removeListener(_onListen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: _navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        accentColor: const Color.fromARGB(255, 255, 255, 255),
        // errorColor: Colors.red,
        // fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              titleMedium: const TextStyle(
                // fontFamily: 'OpenSans',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              // button: TextStyle(color: Colors.white),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                titleMedium: const TextStyle(
                  // fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
      title: 'Grow It Green',
      builder: (context, child) => child!,
      onGenerateRoute: (settings) => SplashView.route(),
      routes: {
        ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
        CartScreen.routeName: (ctx) => CartScreen(),
        OrdersScreen.routeName: (ctx) => OrdersScreen(),
      },
    );
  }
}
