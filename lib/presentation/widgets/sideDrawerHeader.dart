import 'package:flutter/material.dart';
import 'package:grow_it_green/domain/auth_repository/repository.dart';
import 'package:provider/provider.dart';

class SideDrawerHeader extends StatefulWidget {
  const SideDrawerHeader({super.key});

  @override
  _SideDrawerHeaderState createState() => _SideDrawerHeaderState();
}

class _SideDrawerHeaderState extends State<SideDrawerHeader> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthRepository>(context).currentUser;

    return Container(
      color: Colors.green[700],
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/man.png'),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            user.email!,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
