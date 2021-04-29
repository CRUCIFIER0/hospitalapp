
import 'package:flutter/material.dart';
import 'package:hospitalapp/screens/wrapper.dart';

import 'package:hospitalapp/services/auth.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
        value: AuthService().user,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Wrapper(),
        )
    );
  }
}