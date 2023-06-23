import 'package:flutter/material.dart';
import 'package:grow_it_green/domain/services_repository/models/service_model.dart';
import 'package:grow_it_green/presentation/widgets/services_grid.dart';

class ServicesOverviewView extends StatefulWidget {
  const ServicesOverviewView({super.key, required this.services});

  final List<Service> services;

  @override
  State<ServicesOverviewView> createState() => ServicesOverviewViewState();
}

class ServicesOverviewViewState extends State<ServicesOverviewView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Services"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ServicesGrid(services: widget.services),
      ),
    );
  }
}
