import 'package:flutter/material.dart';
import 'package:hospitalapp/models/userdetails.dart';
import 'package:hospitalapp/services/auth.dart';
import 'package:provider/provider.dart';
class Home extends StatefulWidget {
  final UserDetails userDetails;

  const Home({Key key, this.userDetails}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("HOME"),
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
