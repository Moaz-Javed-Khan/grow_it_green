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
  final List<BookedServices> _bookedServices = [];

  List<BookedServices> get bookedServices {
    return [..._bookedServices];
  }

  void addBookedService(
    String id,
    String name,
    num price,
    String date,
    String time,
  ) {
    _bookedServices.insert(
      0,
      BookedServices(
        id: id,
        name: name,
        price: price,
        date: date,
        time: time,
      ),
    );
    notifyListeners();
  }
}
