import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospitalapp/models/userdetails.dart';
import 'package:hospitalapp/services/auth.dart';

class Profile extends StatefulWidget {
  final UserDetails userDetails;

  const Profile({Key key, this.userDetails}) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  AuthService _auth  =  new AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(28, 27, 37, 1),
      body: Container(
        margin: EdgeInsets.only(left: 20,right: 20),
        child: Column(
          children: [
            Image(image: AssetImage('assets/health-hospital-bed.png'),fit: BoxFit.cover,height: 270,),
            SizedBox(height: 20,),
            Align(alignment:Alignment.center,child: Text(widget.userDetails.name,style: GoogleFonts.rubik(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w700,),)),

            widget.userDetails.type=="user"?
            Container(
              child: Column(
                children: [
                  SizedBox(height: 30,),
                  Align(alignment:Alignment.topLeft,child: Text("Have you been vacinated yet?",style: GoogleFonts.rubik(fontSize: 25, color: Colors.blueGrey, fontWeight: FontWeight.w700,),)),
                  Row(
                    children: [
                      IconButton(icon: Icon(EvaIcons.checkmarkCircle, color: Colors.grey,size: 30,), onPressed:() {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => _buildPopupDialog(context),
                        );
                      }),
                      IconButton(icon: Icon(EvaIcons.closeCircleOutline, color: Colors.grey,size: 30,), onPressed:() {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => _buildPopupDialog1(context),
                        );
                      })
                    ],
                  ),
                  SizedBox(height: 130,)
                ],
              ),
            ):Container(child:SizedBox(height: 260,)),

            InkWell(
              onTap: () async{
                await _auth.signOut();
              },
              child: Container(
                height: 70,
                width: 430,
                //color: Colors.white,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child:  Center(child: Text("Sign out",textAlign: TextAlign.center,style: GoogleFonts.rubik(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700,),)),
              ),
            ),
          ],
        )
      ),
    );
  }
  Widget _buildPopupDialog(BuildContext context) {
    return new AlertDialog(
      title: const Text(''),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("That's Great!"),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Close'),
        ),
      ],
    );
  }
  Widget _buildPopupDialog1(BuildContext context) {
    return new AlertDialog(
      title: const Text(''),
      content: new Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("We'll help you find the nearest vaccination center"),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          textColor: Theme.of(context).primaryColor,
          child: const Text('Close'),
        ),
      ],
    );
  }
}
