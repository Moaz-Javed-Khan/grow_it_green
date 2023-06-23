import 'package:flutter/material.dart';
import 'package:grow_it_green/domain/plant_encyclopedias_repository/models/plant_encyclopedia_model.dart';
import 'package:grow_it_green/presentation/widgets/plant_encyclopedia_item_widget.dart';

class PlantEncyclopediasGrid extends StatelessWidget {
  final List<PlantEncyclopedia> plantEncyclopedias;

  const PlantEncyclopediasGrid({required this.plantEncyclopedias});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: plantEncyclopedias.length,
      itemBuilder: (context, index) {
        return PlantEncyclopediaItemWidget(
          plantEncyclopedia: plantEncyclopedias[index],
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 7 / 11,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
