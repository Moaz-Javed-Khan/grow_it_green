import 'package:flutter/material.dart';
import 'package:grow_it_green/presentation/plant_encyclopedia/view/plant_encyclopedia_detail_view.dart';
import 'package:grow_it_green/presentation/widgets/plant_encyclopedia_item_widget.dart';

class PlantEncyclopediaOverviewView extends StatefulWidget {
  const PlantEncyclopediaOverviewView({super.key});

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
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const PlantEncyclopediaDetailView(),
              ),
            );
          },
          child: const PlantEncyclopediaItemWidget(),
        ),
      ),
    );
  }
}
