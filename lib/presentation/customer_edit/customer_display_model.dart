import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customerlistapp2/domain/customer.dart';
import 'package:flutter/material.dart';

class CustomerDisplayModel extends ChangeNotifier {
  Future fetchCustomers() async {
    final docs = await FirebaseFirestore.instance.collection('customers').get();
    final customers = docs.docs.map((doc) => Customer(doc)).toList();
    notifyListeners();

    FirebaseFirestore.instance.collection('customers').doc().get();
  }

  Future updateCustomer(Customer customer) async {
    final document = FirebaseFirestore.instance
        .collection('customers')
        .doc(customer.documentID);
    await document.update;
  }
}
