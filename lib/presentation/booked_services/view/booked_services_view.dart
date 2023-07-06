import 'package:flutter/material.dart';
import 'package:grow_it_green/presentation/booked_services/provider/booked_services_provider.dart'
    show BookedServicesProvider;
import 'package:grow_it_green/presentation/orders/provider/orders_provider.dart'
    show OrdersProvider;
import 'package:grow_it_green/presentation/widgets/booked_service_item.dart';
import 'package:grow_it_green/presentation/widgets/order_item.dart';
import 'package:provider/provider.dart';

class BookedServicesScreen extends StatelessWidget {
  static const routeName = '/booked_service_screen';

  @override
  Widget build(BuildContext context) {
    final bookedServicesData = Provider.of<BookedServicesProvider>(context);
    print(bookedServicesData.booked_services);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Services'),
      ),
      body: ListView.builder(
        itemCount: bookedServicesData.booked_services.length,
        itemBuilder: (ctx, i) => BookedServiceItem(
          bookedService: bookedServicesData.booked_services[i],
        ),
      ),
    );
  }
}
