import 'package:flutter/material.dart';
import 'package:grow_it_green/data/helpers/api_client.dart';
import 'package:grow_it_green/domain/auth_repository/repository.dart';
import 'package:grow_it_green/presentation/app/provider/app_provider.dart';
import 'package:grow_it_green/presentation/app/view/onboarding.dart';
import 'package:grow_it_green/presentation/auth/sign_up/sign_up.dart';
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
      home: Consumer<AppProvider>(
        builder: (context, provider, child) {
          if (provider.onboardingStatus == OnboardingStatus.notOnboarded ||
              provider.onboardingStatus == OnboardingStatus.unknown) {
            // return const Onboarding();
            return const Onboarding();
          } else if (provider.authStatus == AuthStatus.unauthenticated ||
              provider.authStatus == AuthStatus.unknown) {
            // return const LoginPage();
            return const SignUpView();
          } else if (provider.authStatus == AuthStatus.authenticated) {
            // return const HomePage();
            return const HomePage();
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Center(child: Text("Home")),
        TextButton(
          onPressed: () => context.read<AppProvider>().logout(),
          child: const Text("Logout"),
        ),
      ],
    );
  }
}

// class LoginPage extends StatelessWidget {
//   const LoginPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const Center(child: Text("Login Here")),
//         TextButton(
//           onPressed: () => context.read<AppProvider>().login(),
//           child: const Text("Login"),
//         )
//       ],
//     );
//   }
// }

// class Onboarding extends StatelessWidget {
//   const Onboarding({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         children: [
//           const Text("Onboarding"),
//           TextButton(
//             onPressed: () => context.read<AppProvider>().onboardingCompleted(),
//             child: const Text("Get Started"),
//           ),
//         ],
//       ),
//     );
//   }
// }
