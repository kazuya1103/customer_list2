import 'package:cloud_firestore/cloud_firestore.dart';

class Customer {
  Customer(DocumentSnapshot doc) {
    documentID = doc.id;
    name = doc.data()['name'];
    ruby = doc.data()['ruby'];
  }

  String documentID;
  String name;
  String ruby;
}
