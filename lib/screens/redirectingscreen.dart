import 'package:flutter/material.dart';
import 'package:hospitalapp/models/user.dart';
import 'package:hospitalapp/models/userdetails.dart';
import 'package:hospitalapp/screens/navbarselect.dart';
import 'package:hospitalapp/services/database.dart';
import 'package:hospitalapp/widgets/loading.dart';

class RedirectingScreen extends StatelessWidget {
  final User user;

  const RedirectingScreen({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: DatabaseServices(uid: user.uid.toString()).collectionReference.document(user.uid.toString()).collection(user.uid.toString()).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Loading();
        } else {
          return NavBarSelect(userDetails: UserDetails(
            uid: user.uid.toString(),
            name: snapshot.data.documents[0]['name'],
            type: snapshot.data.documents[0]['type'],
            city: snapshot.data.documents[0]['city'],
            email: snapshot.data.documents[0]['email'],

          ));
        }
      },
    );
  }
}