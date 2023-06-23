import 'package:flutter/material.dart';
import 'package:grow_it_green/domain/plant_encyclopedias_repository/models/models.dart';
import 'package:grow_it_green/presentation/widgets/plant_encyclopedias_grid.dart';

class PlantEncyclopediaOverviewView extends StatefulWidget {
  const PlantEncyclopediaOverviewView({
    super.key,
    required this.plantEncyclopedia,
  });

  final List<PlantEncyclopedia> plantEncyclopedia;

  @override
  State<PlantEncyclopediaOverviewView> createState() =>
      PlantEncyclopediaOoverviewViewState();
}

class PlantEncyclopediaOoverviewViewState
    extends State<PlantEncyclopediaOverviewView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Plant Encyclopedia"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PlantEncyclopediasGrid(
          plantEncyclopedias: widget.plantEncyclopedia,
        ),
      ),
    );
  }
}
