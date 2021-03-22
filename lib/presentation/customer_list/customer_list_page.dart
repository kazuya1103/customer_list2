import 'package:customerlistapp2/domain/customer.dart';
import 'package:customerlistapp2/presentation/add_customer/add_customer_page.dart';
import 'package:customerlistapp2/presentation/customer_list/customer_list_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomerListPage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CustomerListModel>(
      create: (_) => CustomerListModel()..fetchCustomers(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('顧客一覧'),
        ),
        body: Consumer<CustomerListModel>(
          builder: (context, model, child) {
            final customers = model.customers;
            final listTiles = customers
                .map((customer) => ListTile(
                      title: Text(customer.name),
                      trailing: Container(
                        width: 96,
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddCustomerPage(
                                            customer: customer,
                                          ),
                                      fullscreenDialog: true),
                                );
                                model.fetchCustomers();
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () async {
                                await showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('${customer.name}を削除しますか？'),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text('ok'),
                                          onPressed: () async {
                                            Navigator.of(context).pop();
                                            await deleteCustomer(
                                                context, model, customer);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ))
                .toList();
            return ListView(
              children: listTiles,
            );
          },
        ),
        floatingActionButton:
            Consumer<CustomerListModel>(builder: (context, model, child) {
          return FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddCustomerPage(),
                    fullscreenDialog: true),
              );
              model.fetchCustomers();
            },
          );
        }),
      ),
    );
  }

  Future deleteCustomer(
    BuildContext context,
    CustomerListModel model,
    Customer customer,
  ) async {
    try {
      await model.deleteCustomer(customer);
      await model.fetchCustomers();
    } catch (e) {
      await _showDialog(context, e.toString());
    }
  }

  Future _showDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          actions: <Widget>[
            FlatButton(
              child: Text('ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
