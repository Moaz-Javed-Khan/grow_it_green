import 'package:flutter/material.dart';
import 'package:grow_it_green/presentation/thankYouView.dart';

class ServiceDetailView extends StatefulWidget {
  const ServiceDetailView({super.key});

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
        title: const Text("Name"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/images/services/3.png",
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            const Text(
              "Name",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 6),
            const Text("Description Description Description Description."),
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
            const SizedBox(height: 20),
            Text(
              "Service Time: ${selectedTime.hour}:${selectedTime.minute}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
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
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ThankYouView(),
                    ),
                  );
                },
                child: const Text("Book"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
