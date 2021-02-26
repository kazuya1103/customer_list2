import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'customer list app',
      home: ChangeNotifierProvider<MainModel>(
        create: (_) => MainModel(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('サンプル'),
          ),
          body: Consumer<MainModel>(builder: (context, model, child) {
            return Center(
              child: Column(
                children: <Widget>[
                  Text(
                    model.kazuyaText,
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  RaisedButton(
                    child: Text('本一覧'),
                    onPressed: () {
                      //  Navigator.push(
                      //  context,
                      // MaterialPageRoute(builder: (context) => BookListPage()),
                      //);
                    },
                  ),
                  RaisedButton(
                    child: Text('新規登録'),
                    onPressed: () {
                      // Navigator.push(
                      // context,
                      // MaterialPageRoute(builder: (context) => SignUpPage()),
                      // );
                    },
                  ),
                  RaisedButton(
                    child: Text('ログイン'),
                    onPressed: () {
                      //Navigator.push(
                      //context,
                      // MaterialPageRoute(builder: (context) =>()),
                      // );
                    },
                  ),
                ],
              ),
            );
          }),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
