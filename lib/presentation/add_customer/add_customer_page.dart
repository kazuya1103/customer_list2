import 'package:customerlistapp2/domain/customer.dart';
import 'package:customerlistapp2/presentation/add_customer/add_customer_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddCustomerPage extends StatelessWidget {
  AddCustomerPage({this.customer});
  final Customer customer;
  @override
  Widget build(BuildContext context) {
    final bool isUpdate = customer != null;
    final textEditingController = TextEditingController();

    if (isUpdate) {
      textEditingController.text = customer.name;
    }

    return ChangeNotifierProvider<AddCustomerModel>(
      create: (_) => AddCustomerModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(isUpdate ? '顧客を編集' : '顧客を追加'),
        ),
        body: Consumer<AddCustomerModel>(
          builder: (context, model, child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: textEditingController,
                    onChanged: (text) {
                      model.customerName = text;
                    },
                  ),
                  RaisedButton(
                    child: Text(isUpdate ? '更新する' : '追加する'),
                    onPressed: () async {
                      if (isUpdate) {
                        await updateCustomer(model, context);
                      } else {
                        await addCustomer(model, context);
                      }
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Future addCustomer(AddCustomerModel model, BuildContext context) async {
    try {
      await model.addCustomerToFirebase();

      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('保存しました！'),
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
      Navigator.of(context).pop();
    } catch (e) {
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(e.toString()),
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

  Future updateCustomer(AddCustomerModel model, BuildContext context) async {
    try {
      await model.updateCustomer(customer);

      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('更新しました！'),
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
      Navigator.of(context).pop();
    } catch (e) {
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(e.toString()),
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
}
