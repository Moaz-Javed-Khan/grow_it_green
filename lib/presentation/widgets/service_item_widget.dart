import 'package:flutter/material.dart';

class ServiceItemWidget extends StatelessWidget {
  const ServiceItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 175,
      height: 230,
      child: Card(
        clipBehavior: Clip.hardEdge,
        elevation: 10.0,
        child: Column(
          children: [
            Image.asset(
              "assets/images/services/3.png",
              width: double.infinity,
              height: 110,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const Text(
                    "Lawn Moving",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text("First Hour Rate: "),
                      const Text("100Rs."),
                    ],
                  ),
                  Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text("Per Hour Rate: "),
                      const Text("50Rs."),
                    ],
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Book This Service",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
