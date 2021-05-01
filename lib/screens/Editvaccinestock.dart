import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospitalapp/models/userdetails.dart';

class Editvaccinestock extends StatefulWidget {
  final UserDetails userDetails;

  const Editvaccinestock({Key key, this.userDetails}) : super(key: key);

  @override
  _EditvaccinestockState createState() => _EditvaccinestockState();
}

class _EditvaccinestockState extends State<Editvaccinestock> {
  String covaxin='';
  String covishield='';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Color.fromRGBO(28, 27, 37, 0.8) ,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 50,left: 24),
            child: Column(
              children: [
                Align(alignment:Alignment.topLeft,child: Text("Modify the stock",style: GoogleFonts.rubik(fontSize: 35, color: Colors.white, fontWeight: FontWeight.w700,),)),
                SizedBox(height: 30,),
                Align(alignment:Alignment.topLeft,child: Text("Enter amount of Covaxin:",style: GoogleFonts.rubik(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.w700,),)),
                SizedBox(height: 15,),
                Container(
                  margin: EdgeInsets.only(top: 0, right: 20, left: 0),
                  //color: Colors.grey,
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xff575757),
                    border: Border.all(
                      color: Color(0xff575757),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(17),
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 12,),
                      Expanded(
                        child: TextField(
                          //controller: myController,
                          style: TextStyle(fontSize: 16, color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Amount of covaxin',
                            hintStyle: TextStyle(fontSize: 15.0, color: Colors.white),
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                          onChanged: (val){
                            setState(() {
                              covaxin=val;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 25,),
                Align(alignment:Alignment.topLeft,child: Text("Enter amount of Covishield:",style: GoogleFonts.rubik(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.w700,),)),
                SizedBox(height: 15,),
                Container(
                  margin: EdgeInsets.only(top: 0, right: 20, left: 0),
                  //color: Colors.grey,
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xff575757),
                    border: Border.all(
                      color: Color(0xff575757),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(17),
                    ),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 12,),
                      Expanded(
                        child: TextField(
                          //controller: myController,
                          style: TextStyle(fontSize: 16, color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'Amount of covishield',
                            hintStyle: TextStyle(fontSize: 15.0, color: Colors.white),
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                          onChanged: (val){
                            setState(() {
                              covishield=val;
                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 280,),

                Container(

                  margin: EdgeInsets.only(left: 0,right: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: InkWell(
                    onTap: () async{
                      await Firestore.instance.collection("user_details").document(widget.userDetails.uid).collection(widget.userDetails.uid).document(widget.userDetails.uid).updateData(
                          {
                              "covaxin" : covaxin.isEmpty? widget.userDetails.covaxin: covaxin,
                              "covishield" :covishield.isEmpty?widget.userDetails.covishield: covishield,
                          });

                      await Firestore.instance.collection("hospitals").document(widget.userDetails.uid).updateData(
                          {
                            "covaxin" : covaxin.isEmpty? widget.userDetails.covaxin: covaxin,
                            "covishield" :covishield.isEmpty?widget.userDetails.covishield: covishield,
                          });
                    },
                    child: Container(
                      height: 70,
                      width: 430,
                      //color: Colors.white,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child:  Center(child: Text("Submit",textAlign: TextAlign.center,style: GoogleFonts.rubik(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700,),)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      
    );
  }
}
