import 'package:flutter/material.dart';
import 'package:workshop_flutter/screens/register.dart';

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
  
  Widget showSignUp(BuildContext context) {
    return RaisedButton(
      child: Text('Sign Up'),
      onPressed: () {
        print('You Click SignUp');
        
        // Create Router
        var registerRoute = MaterialPageRoute(builder: (BuildContext context) => Register());
        Navigator.of(context).push(registerRoute);
      },
    );
  }

  Widget showSignIn() {
    return RaisedButton(
      child: Text('Sign In'),
      onPressed: () {},
    );
  }

  Widget showPassword() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Password : ', hintText: 'More 6 Character'),
    );
  }

  Widget showUser() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'Username : ', hintText: 'Your Username'),
    );
  }

  Widget showLogo() {
    return Image.asset('images/logo.png');
  }

  Widget showTitle() {
    return Text(
      'Beemine food',
      style: TextStyle(
          fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.blue),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.white, Colors.yellow[50]],
                  begin: Alignment(-1, -1))),
          padding: EdgeInsets.only(top: 70.0),
          alignment: Alignment(0, -1),
          child: Column(
            children: <Widget>[
              showLogo(),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: showTitle(),
              ),
              Container(
                margin: EdgeInsets.only(left: 50.0, right: 50.0),
                child: showUser(),
              ),
              Container(
                margin: EdgeInsets.only(left: 50.0, right: 50.0),
                child: showPassword(),
              ),
              Container(
                margin: EdgeInsets.only(left: 50.0, right: 50.0, top: 20.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: showSignIn(),
                    ),
                    Expanded(
                      child: showSignUp(context),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
