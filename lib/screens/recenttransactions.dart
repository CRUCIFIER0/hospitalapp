import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospitalapp/models/userdetails.dart';

class RecentTrans extends StatefulWidget {

  final UserDetails userDetails;

  const RecentTrans({Key key, this.userDetails}) : super(key: key);

  @override
  _RecentTransState createState() => _RecentTransState();
}

class _RecentTransState extends State<RecentTrans> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(28, 27, 37, 1),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20,right: 20),
          child: Column(
            children: [
              SizedBox(height: 50,),
              Align(alignment:Alignment.topLeft,child: Text("Recent Transactions",style: GoogleFonts.rubik(fontSize: 25, color: Colors.white, fontWeight: FontWeight.w700,),)),


              SizedBox(
                height: 500,
                child: StreamBuilder<QuerySnapshot>(
                    stream: Firestore.instance.collection("transactions").snapshots(),
                    builder: (context,snapshot){
                      if(!snapshot.hasData){
                        return Container();
                      }
                      else{
                        return ListView.builder(
                            itemCount: snapshot.data.documents.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context,int index){

                                if(snapshot.data.documents[index]['status']=="1" && snapshot.data.documents[index]['requestedhospital']==widget.userDetails.name){
                                 return InkWell(
                                  onTap: (){

                                  },
                                  child: Container(

                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(width: 20,),
                                            CircleAvatar(radius: 30,),
                                            SizedBox(width: 30,),
                                            Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Align(alignment:Alignment.center,child: Text("Covishield",style: GoogleFonts.rubik(fontSize: 15, color: Colors.grey, fontWeight: FontWeight.w700,),)),
                                                    SizedBox(width: 50,),
                                                    Align(alignment:Alignment.center,child: Text("+ "+snapshot.data.documents[index]['covishield'].toString(),style: GoogleFonts.rubik(fontSize: 15, color: Colors.green, fontWeight: FontWeight.w700,),)),

                                                  ],
                                                ),
                                                SizedBox(height: 15,),
                                                Row(
                                                  children: [
                                                    Align(alignment:Alignment.center,child: Text("Covaxin      ",style: GoogleFonts.rubik(fontSize: 15, color: Colors.grey, fontWeight: FontWeight.w700,),)),
                                                    SizedBox(width: 50,),
                                                    Align(alignment:Alignment.center,child: Text("+ "+snapshot.data.documents[index]['covaxin'].toString(),style: GoogleFonts.rubik(fontSize: 15, color: Colors.green, fontWeight: FontWeight.w700,),)),

                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(width: 40,),

                                          ],
                                        ),
                                        SizedBox(height: 10,),
                                        Divider(color: Colors.grey,thickness: 0.5, indent: 100,endIndent: 65,),
                                        SizedBox(height: 10,)
                                      ],
                                    ),
                                  ),
                                );
                                }
                                else if(snapshot.data.documents[index]['status']=="1" && snapshot.data.documents[index]['reqestedtohos']==widget.userDetails.name){
                                  return InkWell(
                                    onTap: (){

                                    },
                                    child: Container(

                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(width: 20,),
                                              CircleAvatar(radius: 30,),
                                              SizedBox(width: 30,),
                                              Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Align(alignment:Alignment.center,child: Text("Covishield",style: GoogleFonts.rubik(fontSize: 15, color: Colors.grey, fontWeight: FontWeight.w700,),)),
                                                      SizedBox(width: 50,),
                                                      Align(alignment:Alignment.center,child: Text("- "+snapshot.data.documents[index]['covishield'].toString(),style: GoogleFonts.rubik(fontSize: 15, color: Colors.redAccent, fontWeight: FontWeight.w700,),)),

                                                    ],
                                                  ),
                                                  SizedBox(height: 15,),
                                                  Row(
                                                    children: [
                                                      Align(alignment:Alignment.center,child: Text("Covaxin      ",style: GoogleFonts.rubik(fontSize: 15, color: Colors.grey, fontWeight: FontWeight.w700,),)),
                                                      SizedBox(width: 50,),
                                                      Align(alignment:Alignment.center,child: Text("- " + snapshot.data.documents[index]['covaxin'].toString(),style: GoogleFonts.rubik(fontSize: 15, color: Colors.redAccent, fontWeight: FontWeight.w700,),)),

                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(width: 40,),

                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          Divider(color: Colors.grey,thickness: 0.5, indent: 100,endIndent: 65,),
                                          SizedBox(height: 10,)
                                        ],
                                      ),
                                    ),
                                  );
                                }
                                else if(snapshot.data.documents[index]['status']=="2" && snapshot.data.documents[index]['requestedhospital']==widget.userDetails.name)
                                {
                                  return InkWell(
                                    onTap: (){

                                    },
                                    child: Container(

                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(width: 20,),
                                              CircleAvatar(radius: 30,),
                                              SizedBox(width: 30,),
                                              Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Align(alignment:Alignment.center,child: Text("Covishield",style: GoogleFonts.rubik(fontSize: 15, color: Colors.grey, fontWeight: FontWeight.w700,),)),
                                                      SizedBox(width: 50,),
                                                      Align(alignment:Alignment.center,child: Text(snapshot.data.documents[index]['covishield'].toString(),style: GoogleFonts.rubik(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w700,),)),

                                                    ],
                                                  ),
                                                  SizedBox(height: 15,),
                                                  Row(
                                                    children: [
                                                      Align(alignment:Alignment.center,child: Text("Covaxin      ",style: GoogleFonts.rubik(fontSize: 15, color: Colors.grey, fontWeight: FontWeight.w700,),)),
                                                      SizedBox(width: 50,),
                                                      Align(alignment:Alignment.center,child: Text(snapshot.data.documents[index]['covaxin'].toString(),style: GoogleFonts.rubik(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w700,),)),

                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(width: 40,),


                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          Row(
                                            children: [
                                              SizedBox(width: 238,),
                                              Align(alignment:Alignment.center,child: Text("Denied   ",style: GoogleFonts.rubik(fontSize: 12, color: Colors.redAccent, fontWeight: FontWeight.w700,),)),
                                            ],
                                          ),
                                          SizedBox(height: 5,),
                                          Divider(color: Colors.grey,thickness: 0.5, indent: 100,endIndent: 65,),
                                          SizedBox(height: 10,)

                                        ],
                                      ),
                                    ),
                                  );
                                }
                                else if(snapshot.data.documents[index]['status']=="2" && snapshot.data.documents[index]['reqestedtohos']==widget.userDetails.name){
                                  return InkWell(
                                    onTap: (){

                                    },
                                    child: Container(

                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(width: 20,),
                                              CircleAvatar(radius: 30,),
                                              SizedBox(width: 30,),
                                              Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Align(alignment:Alignment.center,child: Text("Covishield",style: GoogleFonts.rubik(fontSize: 15, color: Colors.grey, fontWeight: FontWeight.w700,),)),
                                                      SizedBox(width: 50,),
                                                      Align(alignment:Alignment.center,child: Text(snapshot.data.documents[index]['covishield'].toString(),style: GoogleFonts.rubik(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w700,),)),

                                                    ],
                                                  ),
                                                  SizedBox(height: 15,),
                                                  Row(
                                                    children: [
                                                      Align(alignment:Alignment.center,child: Text("Covaxin      ",style: GoogleFonts.rubik(fontSize: 15, color: Colors.grey, fontWeight: FontWeight.w700,),)),
                                                      SizedBox(width: 50,),
                                                      Align(alignment:Alignment.center,child: Text(snapshot.data.documents[index]['covaxin'].toString(),style: GoogleFonts.rubik(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w700,),)),

                                                    ],
                                                  ),
                                                ],
                                              ),
                                              SizedBox(width: 40,),


                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          Row(
                                            children: [
                                              SizedBox(width: 238,),
                                              Align(alignment:Alignment.center,child: Text("Denied   ",style: GoogleFonts.rubik(fontSize: 12, color: Colors.redAccent, fontWeight: FontWeight.w700,),)),
                                            ],
                                          ),
                                          SizedBox(height: 5,),
                                          Divider(color: Colors.grey,thickness: 0.5, indent: 100,endIndent: 65,),
                                          SizedBox(height: 10,)

                                        ],
                                      ),
                                    ),
                                  );
                                }
                              }




                        );
                      }
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
