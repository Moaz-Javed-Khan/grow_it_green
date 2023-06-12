import 'package:flutter/material.dart';

class PlantEncyclopediaDetailView extends StatefulWidget {
  const PlantEncyclopediaDetailView({super.key});

  @override
  State<PlantEncyclopediaDetailView> createState() =>
      _PlantEncyclopediaDetailViewState();
}

class _PlantEncyclopediaDetailViewState
    extends State<PlantEncyclopediaDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Name"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/images/services/3.png",
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            const Text(
              "Name",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "Season: Summer",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Watering Frequency: __ Times",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Amount Of Water (Per day): __ L",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Description Description Description Description.",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
