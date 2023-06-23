import 'package:flutter/material.dart';
import 'package:grow_it_green/domain/services_repository/models/service_model.dart';
import 'package:grow_it_green/presentation/widgets/service_item_widget.dart';

class ServicesGrid extends StatelessWidget {
  final List<Service> services;

  const ServicesGrid({required this.services});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: services.length,
      itemBuilder: (context, index) {
        return ServiceItemWidget(
          service: services[index],
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
