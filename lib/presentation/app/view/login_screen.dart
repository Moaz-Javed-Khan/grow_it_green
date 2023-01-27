import 'package:flutter/material.dart';
import 'package:grow_it_green/presentation/app/provider/app_provider.dart';
import 'package:grow_it_green/presentation/app/view/signup_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static Route route() => MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Material(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  // Container(
                  //   height: constraints.maxHeight * 0.2,
                  //   child: Image.asset(
                  //     'assets/images/logo.png',
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
                  const SizedBox(
                    height: 100,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                              .hasMatch(value)) {
                        return "Enter Email correctly";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                    // onChanged: (val) {
                    //   titleInput = val;
                    // },
                    // controller: _usernameController,
                    // onSubmitted: (_) => _submitData(),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp('^(?=.*[0-9a-zA-Z]).{6,}').hasMatch(value)) {
                        return "Enter Password correctly";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                    obscureText: true,
                    // onChanged: (val) {
                    //   titleInput = val;
                    // },
                    // controller: _usernameController,
                    // onSubmitted: (_) => _submitData(),
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
                      primary: Theme.of(context).primaryColor,
                    ),
                    onPressed: () => context.read<AppProvider>().login(),
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignupScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
