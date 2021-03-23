import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:customerlistapp2/domain/customer.dart';
import 'package:flutter/material.dart';

class AddCustomerModel extends ChangeNotifier {
  String customerName = '';
  String customerRuby = '';
  String customerMemo = '';

  Future addCustomerToFirebase() async {
    if (customerName.isEmpty) {
      throw ('名前を入力してください');
    } else if (customerRuby.isEmpty) {
      throw ('ふりがなを入力してください');
    } else if (customerMemo.isEmpty) {
      throw ('メモを入力してください');
    }

    FirebaseFirestore.instance.collection('customers').add(
      {'name': customerName, 'ruby': customerRuby, 'memo': customerMemo},
    );
  }

  Future updateCustomer(Customer customer) async {
    final document = FirebaseFirestore.instance
        .collection('customers')
        .doc(customer.documentID);
    await document.update(
      {'name': customerName, 'ruby': customerRuby, 'memo': customerMemo},
    );
  }
}
