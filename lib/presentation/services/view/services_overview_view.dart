import 'package:flutter/material.dart';
import 'package:grow_it_green/presentation/services/view/service_detail_view.dart';
import 'package:grow_it_green/presentation/widgets/service_item_widget.dart';

class ServicesOverviewView extends StatefulWidget {
  const ServicesOverviewView({super.key});

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
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ServiceDetailView(),
              ),
            );
          },
          child: const ServiceItemWidget(),
        ),
      ),
    );
  }
}
