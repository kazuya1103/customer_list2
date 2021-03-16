import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customerlistapp2/domain/customer.dart';
import 'package:flutter/material.dart';

class AddCustomerModel extends ChangeNotifier {
  String customerName = '';

  Future addCustomerToFirebase() async {
    if (customerName.isEmpty) {
      throw ('名前を入力してください');
    }
    FirebaseFirestore.instance.collection('customers').add(
      {'name': customerName},
    );
  }

  Future updateCustomer(Customer customer) async {
    final document = FirebaseFirestore.instance
        .collection('customers')
        .doc(customer.documentID);
    await document.update(
      {'name': customerName},
    );
  }
}
