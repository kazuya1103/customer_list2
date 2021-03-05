import 'package:customerlistapp2/presentation/customer_list/customer_list_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomerListPage extends StatelessWidget {
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
                .map(
                  (customer) => ListTile(
                    title: Text(customer.name),
                  ),
                )
                .toList();
            return ListView(
              children: listTiles,
            );
          },
        ),
      ),
    );
  }
}
