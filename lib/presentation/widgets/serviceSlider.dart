// ignore_for_file: file_names
import 'package:flutter/material.dart';

class ServiceSlider extends StatelessWidget {
  const ServiceSlider({super.key});

  @override
  Widget build(BuildContext context) {
    const List<String> services = [
      "Planting",
      "Pest Control",
      "Lawn moving",
    ];
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 3.5, right: 3.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Services",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              TextButton(
                child: const Text(
                  "View More",
                  style: TextStyle(fontSize: 15),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                services.length,
                (index) => Container(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 5,
                      bottom: 5,
                      right: 10,
                      left: 4,
                    ),
                    height: 150,
                    width: 200,
                    margin: const EdgeInsets.only(right: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.lightGreen,
                          // blurRadius: 5,
                          spreadRadius: 3,
                          offset: Offset(0, 1),
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage(
                            "assets/images/services/${index + 1}.png",
                          ),
                          height: 120,
                          width: 190,
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          services[index].toString(),
                          style: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            letterSpacing: 2,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
