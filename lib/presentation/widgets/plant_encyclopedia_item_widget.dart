import 'package:flutter/material.dart';

class PlantEncyclopediaItemWidget extends StatefulWidget {
  const PlantEncyclopediaItemWidget({super.key});

  @override
  State<PlantEncyclopediaItemWidget> createState() =>
      PplanEencyclopediaItemWidgetState();
}

class PplanEencyclopediaItemWidgetState
    extends State<PlantEncyclopediaItemWidget> {
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
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(
                    "Rose",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text("Despription"),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                "View Detail",
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
