import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:grow_it_green/domain/auth_repository/repository.dart';
import 'package:grow_it_green/presentation/auth/log_in/log_in.dart';
import 'package:grow_it_green/presentation/auth/sign_up/provider/sign_up_provider.dart';
import 'package:grow_it_green/presentation/utils/widgets/snackbars.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  static Route route() =>
      MaterialPageRoute(builder: (context) => const SignUpView());

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignUpProvider(
        authRepository: context.read<AuthRepository>(),
      ),
      child: const _SignUpView(),
    );
  }
}

class _SignUpView extends StatefulWidget {
  const _SignUpView();

  @override
  State<_SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<_SignUpView> {
  late final SignUpProvider provider;

  @override
  void initState() {
    super.initState();
    provider = context.read<SignUpProvider>();
    provider.addListener(_onListen);
  }

  void _onListen() {
    if (provider.formzStatus == FormzStatus.submissionFailure) {
      context.errorSnackbar(provider.error ?? 'Something went wrong!');
    } else if (provider.formzStatus == FormzStatus.submissionSuccess) {
      context.successSnackbar(
        'Signed Up Successfully. Please login to continue.',
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
      body: Consumer<SignUpProvider>(
        builder: (context, provider, _) {
          return SingleChildScrollView(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 50),
                      SizedBox(
                        // height: constraints.maxHeight * 0.2,
                        height: 140,
                        child: Image.asset(
                          'assets/images/logo.png',
                          // fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 50),
                      // TextFormField(
                      //   validator: (value) {
                      //     if (value!.isEmpty ||
                      //         !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      //       return "Enter Name correctly";
                      //     } else {
                      //       return null;
                      //     }
                      //   },
                      //   decoration: const InputDecoration(
                      //     labelText: 'Full Name',
                      //   ),
                      //   // onChanged: (val) {
                      //   //   titleInput = val;
                      //   // },
                      //   // controller: _usernameController,
                      //   // onSubmitted: (_) => _submitData(),
                      // ),
                      // TextFormField(
                      //   validator: (value) {
                      //     if (value!.isEmpty ||
                      //         !RegExp(r'^[+]*[(]{0,1}[0-9]{1-4}[)]{0,1}[-\s\./0-9]+$')
                      //             .hasMatch(value)) {
                      //       return "Enter Contact Number correctly";
                      //     } else {
                      //       return null;
                      //     }
                      //   },
                      //   decoration: const InputDecoration(
                      //     labelText: 'Contact Number',
                      //   ),
                      //   // onChanged: (val) {
                      //   //   titleInput = val;
                      //   // },
                      //   // controller: _usernameController,
                      //   // onSubmitted: (_) => _submitData(),
                      // ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          errorText: provider.getEmailError(),
                        ),
                        onChanged: (value) =>
                            context.read<SignUpProvider>().emailChanged(value),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                          errorText: provider.getPasswordError(),
                        ),
                        onChanged: (value) => context
                            .read<SignUpProvider>()
                            .passwordChanged(value),
                      ),
                      const SizedBox(height: 20),
                      if (provider.formzStatus.isSubmissionInProgress)
                        const CircularProgressIndicator()
                      else
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
                              : () => context.read<SignUpProvider>().signUp(),
                          child: const Text(
                            'Signup',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      Row(
                        children: [
                          const SizedBox(height: 100),
                          const Text("Already have an account? "),
                          TextButton(
                            child: const Text(
                              "Login.",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LogInView(),
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
            ),
          );
        },
      ),
    );
  }
}
