import 'package:customerlistapp2/login/login_page.dart';
import 'package:customerlistapp2/signup/signup_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    final mailController = TextEditingController();
    final passwordController = TextEditingController();

    return ChangeNotifierProvider<SignUpModel>(
      create: (_) => SignUpModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('サインアップ'),
        ),
        body: Consumer<SignUpModel>(
          builder: (context, model, child) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'example@gmail.com',
                    ),
                    controller: mailController,
                    onChanged: (text) {
                      model.mail = text;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'パスワード',
                    ),
                    obscureText: true,
                    controller: passwordController,
                    onChanged: (text) {
                      model.password = text;
                    },
                  ),
                  RaisedButton(
                    child: Text('登録する'),
                    onPressed: () async {
                      try {
                        await model.signUp();

                        await showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('登録完了しました！'),
                                actions: <Widget>[
                                  FlatButton(
                                      child: Text('ok'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        //Navigator.push(
                                        //    context,
                                        //    MaterialPageRoute(
                                        //       builder: (context) =>
                                        //           LoginPage()));
                                      })
                                ],
                              );
                            });
                        //_showDialog(context, '登録完了しました！');
                        //  AlertDialog(title: Text('登録完了しました！'), actions: <Widget>[
                        //     FlatButton(
                        //        child: Text('ok'),
                        //        onPressed: (
                        //     await
                        //await Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //
                        //        builder: (context) => LoginPage()));
                        Navigator.of(context).pop();
                      } catch (e) {
                        _showDialog(context, 'メールアドレスを正しく入力してください');
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

  Future _showDialog(
    BuildContext context,
    String title,
  ) {
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
