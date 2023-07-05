import 'package:flutter/material.dart';
import 'package:grow_it_green/domain/services_repository/models/service_model.dart';
import 'package:grow_it_green/presentation/services/view/check_out_service_view.dart';
import 'package:grow_it_green/presentation/thank_you_view.dart';

class ServiceDetailView extends StatefulWidget {
  const ServiceDetailView({super.key, required this.service});

  final Service service;

  @override
  State<ServiceDetailView> createState() => _ServiceDetailViewState();
}

class _ServiceDetailViewState extends State<ServiceDetailView> {
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.service.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                widget.service.image!,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              Text(
                widget.service.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                widget.service.description,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                "Craftsmen: ${widget.service.craftsmenType!}",
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Service Date: ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  final DateTime? dateTime = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime(2023),
                    lastDate: DateTime(3000),
                  );
                  if (dateTime != null) {
                    setState(() {
                      selectedDate = dateTime;
                    });
                  }
                },
                child: const Text("Choose Date"),
              ),
              const SizedBox(height: 18),
              Text(
                "Service Time: ${selectedTime.hour}:${selectedTime.minute}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 14),
              ElevatedButton(
                onPressed: () async {
                  final TimeOfDay? timeOfDay = await showTimePicker(
                    context: context,
                    initialTime: selectedTime,
                    initialEntryMode: TimePickerEntryMode.dial,
                  );
                  if (timeOfDay != null) {
                    setState(() {
                      selectedTime = timeOfDay;
                    });
                  }
                },
                child: const Text("Choose Time"),
              ),
              const SizedBox(height: 18),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    String serviceDate =
                        "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";

                    String startTime =
                        "${selectedTime.hour}:${selectedTime.minute}";

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CheckOutServiceView(
                          service: widget.service,
                          serviceDate: serviceDate,
                          startTime: startTime,
                        ),
                      ),
                    );
                  },
                  child: const Text("Book"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
