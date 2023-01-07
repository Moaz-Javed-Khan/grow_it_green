import 'package:flutter/material.dart';
import 'package:grow_it_green/api/helpers/api_client.dart';
import 'package:grow_it_green/presentation/app/provider/app_provider.dart';
import 'package:grow_it_green/repository/auth_repository/repository.dart';
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
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ,
      home: Container(),
    );
  }
}
