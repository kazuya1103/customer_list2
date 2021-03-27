import 'package:customerlistapp2/domain/customer.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CustomerListModel extends ChangeNotifier {
  List<Customer> customers = [];
  //String usersEmail = '';
  // String customersUser = '';

  Future fetchCustomers() async {
    final docs = await FirebaseFirestore.instance
        .collection('customers')
        //  .where(usersEmail = customersUser)
        .get();
    final customers = docs.docs.map((doc) => Customer(doc)).toList();
    this.customers = customers;
    customers.sort((a, b) => a.ruby.compareTo(b.ruby));
    notifyListeners();
  }

  Future deleteCustomer(Customer customer) async {
    await FirebaseFirestore.instance
        .collection('customers')
        .doc(customer.documentID)
        .delete();
  }
}
