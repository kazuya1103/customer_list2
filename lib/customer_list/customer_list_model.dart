import 'package:customerlistapp2/customer.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CustomerListModel extends ChangeNotifier {
  List<Customer> customers = [];

  Future fetchCustomers() async {
    final docs = await FirebaseFirestore.instance.collection('customers').get();
    final customers = docs.docs.map((doc) => Customer(doc['name'])).toList();
    this.customers = customers;
    notifyListeners();
  }
}
