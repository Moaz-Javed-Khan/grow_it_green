// ignore_for_file: unnecessary_statements

import 'package:flutter/material.dart';
import 'package:grow_it_green/presentation/app/provider/app_provider.dart';
import 'package:grow_it_green/presentation/orders/view/orders_view.dart';
import 'package:provider/provider.dart';

class SideDrawerList extends StatefulWidget {
  const SideDrawerList({super.key});

  @override
  State<SideDrawerList> createState() => _SideDrawerListState();
}

class _SideDrawerListState extends State<SideDrawerList> {
  @override
  Widget build(BuildContext context) {
    bool loggedin = true;
    String? text;

    // ignore: dead_code
    if (loggedin) {
      text = "Logout";
      // ignore: dead_code
    } else {
      text = "Login";
    }

    return Column(
      children: [
        ListTile(
          title: const Text('My Account'),
          onTap: () {
            Navigator.pop(context);
          },
          leading: const Icon(Icons.account_box_rounded),
          // trailing: Icon(Icons.exit_to_app_outlined)
        ),
        ListTile(
          title: const Text('Services History'),
          onTap: () {
            Navigator.pop(context);
          },
          leading: const Icon(Icons.work_history),
          // trailing: Icon(Icons.exit_to_app_outlined)
        ),
        ListTile(
          title: const Text('Order History'),
          onTap: () {
            Navigator.of(context).pushNamed(OrdersScreen.routeName);
          },
          leading: const Icon(Icons.history),
          // trailing: Icon(Icons.exit_to_app_outlined)
        ),
        ListTile(
          title: const Text("Log Out"),
          onTap: () => context.read<AppProvider>().logout(),
          leading: const Icon(Icons.logout),
          // trailing: Icon(Icons.exit_to_app_outlined)
        ),
      ],
    );
  }
}
