import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:grow_it_green/domain/services_repository/models/service_model.dart';
import 'package:grow_it_green/presentation/booked_services/provider/booked_services_provider.dart';
import 'package:grow_it_green/presentation/thank_you_view.dart';
import 'package:provider/provider.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class CheckOutServiceView extends StatefulWidget {
  const CheckOutServiceView({
    super.key,
    required this.service,
    required this.serviceDate,
    required this.startTime,
  });

  final Service service;
  final String serviceDate;
  final String startTime;

  @override
  State<CheckOutServiceView> createState() => _CheckOutServiceViewState();
}

class _CheckOutServiceViewState extends State<CheckOutServiceView> {
  TextEditingController userNameController = TextEditingController();

  TextEditingController userAddressController = TextEditingController();

  TextEditingController userPhoneController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final dataBaseRef = FirebaseDatabase.instance.ref('bookedServices');

  // firebase_storage.FirebaseStorage storage =
  //     firebase_storage.FirebaseStorage.instance;

  emptyTextFieldSnackbar() {
    final snackBar = SnackBar(
      content: const Text('Fill Text Field Please!'),
      backgroundColor: Colors.black,
      action: SnackBarAction(
        label: 'dismiss',
        onPressed: () {},
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
        backgroundColor: Colors.lightGreen,
      ),
      body: Form(
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Column(
                  children: [
                    TextFormField(
                      // autofillHints: const [AutofillHints.username],
                      controller: userNameController,
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                          return "Enter Name correctly";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),

                        // hintText: 'Name',
                        labelText: 'Name',
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                          borderSide: BorderSide(
                            color: Colors.lightGreen,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: userPhoneController,
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^(?:[+0]9)?[0-9]{10,12}$')
                                .hasMatch(value)) {
                          return "Enter Contact Number correctly";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),
                        labelText: 'Contact Number',
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                          borderSide: BorderSide(
                            color: Colors.lightGreen,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      // autofillHints: [AutofillHints.address],
                      controller: userAddressController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Address correctly";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2.0),
                        ),

                        // hintText: 'Name',
                        labelText: 'Address',
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Service: ${widget.service.name}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Price: ${widget.service.initialPrice} Rs.',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          'Date: ${widget.serviceDate}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Time: ${widget.startTime}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      String id =
                          DateTime.now().millisecondsSinceEpoch.toString();

                      Provider.of<BookedServicesProvider>(
                        context,
                        listen: false,
                      ).addBookedService(
                        id,
                        widget.service.name,
                        widget.service.initialPrice!,
                        widget.serviceDate,
                        widget.startTime,
                      );

                      dataBaseRef.child(id).set({
                        'id': id,
                        'name': widget.service.name,
                        'serviceId': widget.service.id,
                        'craftsman': widget.service.craftsmenType,
                        'serviceDate': widget.serviceDate,
                        'startTime': widget.startTime,
                        'customerName': userNameController.text.toString(),
                        'contactNumber': userPhoneController.text.toString(),
                        'address': userAddressController.text.toString(),
                      }).then((value) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Service Booked"),
                        ));
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ThankYouView(),
                          ),
                        );
                      }).onError((error, stackTrace) {
                        print(error.toString());
                      });
                      //ClearCartItem
                    }
                  },
                  // style: OutlinedButton.styleFrom(
                  //   foregroundColor: Colors.black,
                  //   side: const BorderSide(color: Colors.lightGreen),
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(8),
                  //   ),
                  // ),
                  child: const Text('Book!'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
