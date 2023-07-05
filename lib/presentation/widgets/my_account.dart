import 'package:flutter/material.dart';
import 'package:grow_it_green/presentation/app/provider/app_provider.dart';
import 'package:provider/provider.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({super.key});
  static const routeName = '/myAccount';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Account"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const Text(
              "Name",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () => context.read<AppProvider>().logout(),
              child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text("Log Out"),
                  const SizedBox(width: 10),
                  const Icon(Icons.logout),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
