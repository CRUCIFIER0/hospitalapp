import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      body: Container(
        margin: EdgeInsets.only(left: 24,right: 20,top: 50),
        child: Column(

          children: [
            Align(alignment:Alignment.topLeft,child: Text("Hey,",style: GoogleFonts.rubik(fontSize: 35, color: Colors.white, fontWeight: FontWeight.w700,),)),

            Align(alignment:Alignment.topLeft,child: Text(widget.userDetails.name,style: GoogleFonts.rubik(fontSize: 35, color: Colors.white, fontWeight: FontWeight.w700,),)),
            Image(image: AssetImage('assets/health-vaccine-row.png'),height: 250,width: 3000,fit: BoxFit.cover,),

            SizedBox(height: 50,),
            Align(alignment:Alignment.topLeft,child: Text("Let's get you vaccinated in your nearest hospital.",style: GoogleFonts.rubik(fontSize: 25, color: Colors.grey, fontWeight: FontWeight.w700,),)),
            SizedBox(height: 30,),
            Align(alignment:Alignment.topLeft,child: Text("Explore your nearest vaccination centers.",style: GoogleFonts.rubik(fontSize: 25, color: Colors.blueGrey, fontWeight: FontWeight.w700,),)),


          ],
        ),
      ),
    );
  }
}
