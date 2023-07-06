import 'package:flutter/foundation.dart';

class BookedServices {
  final String id;
  final String name;
  final num price;
  final String date;
  final String time;

  BookedServices({
    required this.id,
    required this.name,
    required this.price,
    required this.date,
    required this.time,
  });
}

class BookedServicesProvider with ChangeNotifier {
  List<BookedServices> _booked_services = [];

  List<BookedServices> get booked_services {
    return [..._booked_services];
  }

  void addBookedService(
      String id, String name, num price, String date, String time) {
    _booked_services.insert(
      0,
      BookedServices(
        id: DateTime.now().toString(),
        name: name,
        price: price,
        date: date,
        time: time,
      ),
    );
    notifyListeners();
  }
}
