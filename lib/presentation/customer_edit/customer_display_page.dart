import 'package:customerlistapp2/domain/customer.dart';
import 'package:customerlistapp2/presentation/customer_edit/customer_display_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomerDisplayPage extends StatelessWidget {
  CustomerDisplayPage({this.customer});

  final Customer customer;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CustomerDisplayModel>(
      create: (_) => CustomerDisplayModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('顧客詳細'),
        ),
        body: Consumer<CustomerDisplayModel>(
          builder: (context, model, child) {},
        ),
      ),
    );
  }
}
