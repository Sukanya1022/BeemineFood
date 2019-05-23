import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();

  String name, user, password;

  Widget uploadBtn(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {
        print('you click register');
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print('name = $name, user = $user, password = $password');
          uploadValueToServer(context);
        }
      },
    );
  }

  void uploadValueToServer(BuildContext context) async {
    String urlPHP =
        'https://www.androidthai.in.th/tid/addUserUng.php?isAdd=true&Name=$name&User=$user&Password=$password';

        var response = await get(urlPHP);
        var resultString = json.decode(response.body);
        print('resultString ==> $resultString');

        if (resultString.toString() == 'true') {
          // create pop
          Navigator.of(context).pop();
        }
  }

  Widget nameTextFormField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name :', hintText: 'your name'),
      validator: (String value) {
        if (value.length == 0) {
          return 'please fill name in blank';
        }
      },
      onSaved: (String value) {
        name = value;
      },
    );
  }

  Widget userTextFormField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'User', hintText: 'type your user'),
      validator: (String value) {
        if (value.length == 0) {
          return 'please fill username in blank';
        }
      },
      onSaved: (String value) {
        user = value;
      },
    );
  }

  Widget passwordTextFormFeild() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'Password', hintText: 'youe password'),
      validator: (String value) {
        if (value.length <= 5) {
          return 'ต้องมีตัวอักษรมากกว่า 6 ตัว';
        }
      },
      onSaved: (String value) {
        password = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        actions: <Widget>[uploadBtn(context)],
      ),
      body: Form(
        key: formKey,
        child: Container(
          padding: EdgeInsets.all(50.0),
          child: Column(
            children: <Widget>[
              nameTextFormField(),
              userTextFormField(),
              passwordTextFormFeild()
            ],
          ),
        ),
      ),
    );
  }
}
