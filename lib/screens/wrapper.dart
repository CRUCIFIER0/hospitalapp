
import 'package:flutter/material.dart';
import 'package:hospitalapp/screens/redirectingscreen.dart';
import 'package:hospitalapp/screens/signup.dart';

import '../models/user.dart';
import 'package:provider/provider.dart';


class Wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    // return home or authenticate
    if(user == null){
      return SignUp();
    }else{
      return RedirectingScreen(user: user,);
    }
  }
}