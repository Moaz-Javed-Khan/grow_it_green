import 'package:flutter/material.dart';
import 'package:grow_it_green/presentation/orders/provider/orders_provider.dart'
    as ord;
import 'package:grow_it_green/presentation/booked_services/provider/booked_services_provider.dart'
    as bsp;

class BookedServiceItem extends StatefulWidget {
  final bsp.BookedServices bookedService;

  const BookedServiceItem({required this.bookedService});

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<BookedServiceItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(widget.bookedService.name),
            subtitle: Text('Rs.${widget.bookedService.price}'),
            trailing: SizedBox(
              width: 200,
              child: Row(
                children: [
                  Text(widget.bookedService.date),
                  const SizedBox(width: 10),
                  Text(widget.bookedService.time),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
