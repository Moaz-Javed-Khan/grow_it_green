import 'package:flutter/material.dart';
import 'package:grow_it_green/domain/plant_encyclopedias_repository/models/plant_encyclopedia_model.dart';
import 'package:grow_it_green/presentation/plant_encyclopedia/view/plant_encyclopedia_detail_view.dart';

class PlantEncyclopediaItemWidget extends StatefulWidget {
  const PlantEncyclopediaItemWidget({
    super.key,
    required this.plantEncyclopedia,
  });

  final PlantEncyclopedia plantEncyclopedia;

  @override
  State<PlantEncyclopediaItemWidget> createState() =>
      PplanEencyclopediaItemWidgetState();
}

class PplanEencyclopediaItemWidgetState
    extends State<PlantEncyclopediaItemWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlantEncyclopediaDetailView(
                plantEncyclopedia: widget.plantEncyclopedia),
          ),
        );
      },
      child: SizedBox(
        width: 175,
        height: 230,
        child: Card(
          clipBehavior: Clip.hardEdge,
          elevation: 10.0,
          child: Column(
            children: [
              Image.network(
                widget.plantEncyclopedia.image!,
                width: double.infinity,
                height: 120,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      widget.plantEncyclopedia.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.plantEncyclopedia.description,
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 15,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlantEncyclopediaDetailView(
                          plantEncyclopedia: widget.plantEncyclopedia),
                    ),
                  );
                },
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
      ),
    );
  }
}
