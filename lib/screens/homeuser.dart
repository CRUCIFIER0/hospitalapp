import 'package:flutter/material.dart';
import 'package:hospitalapp/models/userdetails.dart';
import 'package:hospitalapp/services/auth.dart';

class Homeuser extends StatefulWidget {
  final UserDetails userDetails;

  const Homeuser({Key key, this.userDetails}) : super(key: key);
  @override
  _HomeuserState createState() => _HomeuserState();
}

class _HomeuserState extends State<Homeuser> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(28, 27, 37, 1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("HOME USER"),
            RaisedButton(
              onPressed: () async{

                await _auth.signOut();
              },
              child: Text("Sign out"),
            ),
          ],
        ),
      ),
    );
  }
}
