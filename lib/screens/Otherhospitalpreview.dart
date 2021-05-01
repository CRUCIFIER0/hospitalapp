import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospitalapp/models/userdetails.dart';
import 'package:hospitalapp/services/database.dart';

class OtherHospitalPreview extends StatefulWidget {
  final UserDetails userDetails;
  final String name, covaxin, covishield, myname,city;


  const OtherHospitalPreview({Key key, this.name, this.covaxin, this.covishield, this.myname, this.city, this.userDetails, }) : super(key: key);
  @override
  _OtherHospitalPreviewState createState() => _OtherHospitalPreviewState();
}

class _OtherHospitalPreviewState extends State<OtherHospitalPreview> {

  String amountofcovax='';
  String amountofcovi='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(28, 27, 37, 1),
      body:SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 65,left: 24,right: 24),
            child: Column(
              children: [
                Align(alignment:Alignment.topLeft,child: Text(widget.name,style: GoogleFonts.rubik(fontSize: 35, color: Colors.white, fontWeight: FontWeight.w700,),)),
                SizedBox(height: 10,),
                Align(alignment:Alignment.topLeft,child: Text("Current stock",style: GoogleFonts.rubik(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.w700,),)),
                SizedBox(height: 20,),
                Container(

                  height: 240,
                  width: 350,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(34, 33, 43, 1),
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: Container(
                    margin: EdgeInsets.only(left: 18,top: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Align(alignment:Alignment.topLeft,child: Text("Covid Vaccines - ",style: GoogleFonts.rubik(fontSize: 25, color: Colors.white, fontWeight: FontWeight.w700,),)),
                            SizedBox(width: 50,),
                          ],
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            Column(
                              children: [
                                Align(alignment:Alignment.topLeft,child: Text("Covishield -",style: GoogleFonts.rubik(fontSize: 15, color: Colors.grey, fontWeight: FontWeight.w700,),)),
                                SizedBox(height: 3,),
                                Row(
                                  children: [
                                    Icon(EvaIcons.link2Outline,size: 15, color: Colors.white,),
                                    SizedBox(width: 10),
                                    Align(alignment:Alignment.topLeft,child: Text(widget.covishield.toString(),style: GoogleFonts.rubik(fontSize: 25, color: Colors.white, fontWeight: FontWeight.w700,),)),
                                  ],
                                ),
                                SizedBox(height: 12,),
                                Align(alignment:Alignment.topLeft,child: Text("Covaxine -",style: GoogleFonts.rubik(fontSize: 15, color: Colors.grey, fontWeight: FontWeight.w700,),)),
                                SizedBox(height: 3,),
                                Row(
                                  children: [
                                    Icon(EvaIcons.link2Outline,size: 15, color: Colors.white,),
                                    SizedBox(width: 10),
                                    Align(alignment:Alignment.topLeft,child: Text(widget.covaxin.toString(),style: GoogleFonts.rubik(fontSize: 25, color: Colors.white, fontWeight: FontWeight.w700,),)),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(width: 50,),
                            Image(image: AssetImage('assets/health-doctor-vaccine.png'),height: 140,width: 160,fit: BoxFit.fill,),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 22,),

                    widget.userDetails.type=="hospital"?
                    Container(
                      child: Column(
                        children: [
                          Align(alignment:Alignment.topLeft,child: Text("Enter amount of Covaxin:",style: GoogleFonts.rubik(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.w700,),)),
                          SizedBox(height: 15,),
                          Container(
                            margin: EdgeInsets.only(top: 0, right: 0, left: 0),
                            //color: Colors.grey,
                            height: 50,
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
                                        amountofcovax=val;
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
                            margin: EdgeInsets.only(top: 0, right: 0, left: 0),
                            //color: Colors.grey,
                            height: 50,
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
                                        amountofcovi=val;
                                      });
                                    },
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 40,),

                          Container(

                            margin: EdgeInsets.only(left: 0,right: 0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            child: InkWell(
                              onTap: () async{
                                await await Firestore.instance.collection("transactions").document().setData({
                                  "requestedhospital": widget.myname,
                                  "reqestedtohos":widget.name,
                                  "city":widget.city,
                                  "covaxin":amountofcovax,
                                  "covishield":amountofcovi,
                                  "status":"0"

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
                    ): Container()



              ],
            ),

          )
      )    ,
    );
  }
}
