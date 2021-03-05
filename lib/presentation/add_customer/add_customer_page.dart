import 'package:customerlistapp2/presentation/add_customer/add_customer_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddCustomerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddCustomerModel>(
      create: (_) => AddCustomerModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('顧客を追加'),
        ),
        body: Consumer<AddCustomerModel>(
          builder: (context, model, child) {
            return Container();
          },
        ),
      ),
    );
  }
}
