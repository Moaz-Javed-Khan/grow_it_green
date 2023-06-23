import 'package:flutter/material.dart';
import 'package:grow_it_green/domain/plant_encyclopedias_repository/models/plant_encyclopedia_model.dart';

class PlantEncyclopediaDetailView extends StatefulWidget {
  const PlantEncyclopediaDetailView({
    super.key,
    required this.plantEncyclopedia,
  });

  final PlantEncyclopedia plantEncyclopedia;

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
        title: Text(widget.plantEncyclopedia.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.plantEncyclopedia.image!,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Text(
              widget.plantEncyclopedia.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "Season: ${widget.plantEncyclopedia.season}",
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Watering Frequency: ${widget.plantEncyclopedia.wateringFrequency} Time(s)",
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Amount Of Water (Per day): ${widget.plantEncyclopedia.amountOfWater} L",
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.plantEncyclopedia.description,
              style: const TextStyle(
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
