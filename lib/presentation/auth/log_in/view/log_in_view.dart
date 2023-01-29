import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:grow_it_green/domain/auth_repository/repository.dart';
import 'package:grow_it_green/presentation/auth/log_in/log_in.dart';
import 'package:grow_it_green/presentation/auth/log_in/provider/log_in_provider.dart';
import 'package:grow_it_green/presentation/auth/sign_up/sign_up.dart';
import 'package:grow_it_green/presentation/utils/widgets/snackbars.dart';
import 'package:grow_it_green/presentation/app/provider/app_provider.dart';
import 'package:provider/provider.dart';

class LogInView extends StatelessWidget {
  const LogInView({super.key});

  static Route route() => MaterialPageRoute(
        builder: (context) => const LogInView(),
      );

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LogInProvider(
        authRepository: context.read<AuthRepository>(),
      ),
      child: const _LogInView(),
    );
  }
}

class _LogInView extends StatefulWidget {
  const _LogInView();

  @override
  State<_LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<_LogInView> {
  late final LogInProvider provider;

  @override
  void initState() {
    super.initState();
    provider = context.read<LogInProvider>();
    provider.addListener(_onListen);
  }

  void _onListen() {
    if (provider.formzStatus == FormzStatus.submissionFailure) {
      context.errorSnackbar(provider.error ?? 'Something went wrong!');
    } else if (provider.formzStatus == FormzStatus.submissionSuccess) {
      context.successSnackbar(
        'Logged In Successfully.',
      );
      Navigator.pushReplacement(context, LogInView.route());
    }
  }

  @override
  void dispose() {
    provider.removeListener(_onListen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LogInProvider>(
        builder: (context, provider, _) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Image.asset(
                      'assets/images/logo.png',
                      fit: BoxFit.cover,
                      height: constraints.maxHeight * 0.2,
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        errorText: provider.getEmailError(),
                      ),
                      onChanged: (value) =>
                          context.read<LogInProvider>().emailChanged(value),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Password',
                        errorText: provider.getPasswordError(),
                      ),
                      obscureText: true,
                      onChanged: (value) =>
                          context.read<LogInProvider>().passwordChanged(value),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.only(
                          top: 10.0,
                          bottom: 10.0,
                          left: 20.0,
                          right: 20.0,
                        ),
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      onPressed: provider.formzStatus.isInvalid
                          ? null
                          : () => context.read<LogInProvider>().logIn(),
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Row(
                      children: [
                        const SizedBox(height: 100),
                        const Text("Don't Have an account "),
                        TextButton(
                          child: const Text(
                            "Signup.",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpView(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
