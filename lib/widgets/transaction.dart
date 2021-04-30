import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Transaction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Row(
        children: [
          CircleAvatar(radius: 35,),
          SizedBox(width: 30,),
          Column(
            children: [
              Align(alignment:Alignment.center,child: Text("Apr 30 - 19:00",style: GoogleFonts.rubik(fontSize: 15, color: Colors.grey, fontWeight: FontWeight.w700,),)),
              SizedBox(height: 15,),
              Align(alignment:Alignment.center,child: Text("Covaxin",style: GoogleFonts.rubik(fontSize: 25, color: Colors.white, fontWeight: FontWeight.w700,),)),

            ],
          ),
          SizedBox(width: 40,),
          Align(alignment:Alignment.center,child: Text("+  1402",style: GoogleFonts.rubik(fontSize: 25, color: Colors.white, fontWeight: FontWeight.w700,),)),

        ],
      ),
    );
  }
}
