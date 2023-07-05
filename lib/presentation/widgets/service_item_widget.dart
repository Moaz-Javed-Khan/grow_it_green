import 'package:flutter/material.dart';
import 'package:grow_it_green/domain/services_repository/models/service_model.dart';
import 'package:grow_it_green/presentation/services/view/service_detail_view.dart';

class ServiceItemWidget extends StatelessWidget {
  final Service service;

  const ServiceItemWidget({
    super.key,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ServiceDetailView(service: service),
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
                service.image!,
                width: double.infinity,
                height: 120,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text(
                      service.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text(
                          "First Hour Rate: ",
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          service.initialPrice.toString(),
                          style: const TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text(
                          "Per Hour Rate: ",
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          service.perHourRate.toString(),
                          style: const TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ServiceDetailView(service: service),
                    ),
                  );
                },
                child: const Text(
                  "Book This Service",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,
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
