import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospitalapp/models/userdetails.dart';
import 'package:hospitalapp/screens/Editvaccinestock.dart';
import 'package:hospitalapp/services/auth.dart';
import 'package:hospitalapp/widgets/transaction.dart';
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
      backgroundColor: Color.fromRGBO(28, 27, 37, 1),
      body:SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 65,left: 24,right: 24),
        child: Column(
          children: [
            Align(alignment:Alignment.topLeft,child: Text(widget.userDetails.name,style: GoogleFonts.rubik(fontSize: 35, color: Colors.white, fontWeight: FontWeight.w700,),)),
            SizedBox(height: 10,),
            Align(alignment:Alignment.topLeft,child: Text("Existing stock",style: GoogleFonts.rubik(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.w700,),)),
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
                        IconButton(icon: Icon(EvaIcons.edit,color: Colors.white,), onPressed: () async{
                          //await _auth.signOut();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Editvaccinestock(userDetails: widget.userDetails)),
                          );



                        })
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
                                Align(alignment:Alignment.topLeft,child: Text(widget.userDetails.covishield.toString(),style: GoogleFonts.rubik(fontSize: 25, color: Colors.white, fontWeight: FontWeight.w700,),)),
                              ],
                            ),
                            SizedBox(height: 12,),
                            Align(alignment:Alignment.topLeft,child: Text("Covaxine -",style: GoogleFonts.rubik(fontSize: 15, color: Colors.grey, fontWeight: FontWeight.w700,),)),
                            SizedBox(height: 3,),
                            Row(
                              children: [
                                Icon(EvaIcons.link2Outline,size: 15, color: Colors.white,),
                                SizedBox(width: 10),
                                Align(alignment:Alignment.topLeft,child: Text(widget.userDetails.covaxin.toString(),style: GoogleFonts.rubik(fontSize: 25, color: Colors.white, fontWeight: FontWeight.w700,),)),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(width: 50,),
                        Image(image: AssetImage('assets/health-doctor-vaccine1.png'),height: 140,width: 160,fit: BoxFit.fill,),
                      ],
                    ),

                  ],
                ),
              ),
            ),
            SizedBox(height: 22,),
            Align(alignment:Alignment.center,child: Text("Pending Transactions",style: GoogleFonts.rubik(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700,),)),
            SizedBox(height: 15,),

            SizedBox(
              height: 220,
              child: StreamBuilder<QuerySnapshot>(
                  stream: Firestore.instance.collection("transactions").snapshots(),
                  builder: (context,snapshot){
                    if(!snapshot.hasData){
                      return Image(image: AssetImage('assets/health-meditation.png'));
                    }
                    else{
                      return ListView.builder(
                          itemCount: snapshot.data.documents.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context,int index){
                            return (snapshot.data.documents[index]['reqestedtohos'] == widget.userDetails.name && snapshot.data.documents[index]['status']=="0") ?
                            InkWell(
                              onTap: (){
                                //Navigator.push(context, MaterialPageRoute(builder: (context) => OtherHospitalPreview(city:widget.userDetails.city,myname: widget.userDetails.name, name: snapshot.data.documents[index]['name'], covaxin: snapshot.data.documents[index]['covaxin'], covishield: snapshot.data.documents[index]['covishield']))
                              },
                              child: Container(

                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(width: 25,),
                                        CircleAvatar(radius: 30,),
                                        SizedBox(width: 30,),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                Align(alignment:Alignment.center,child: Text("Covishield",style: GoogleFonts.rubik(fontSize: 15, color: Colors.grey, fontWeight: FontWeight.w700,),)),
                                                SizedBox(width: 30,),
                                                Align(alignment:Alignment.center,child: Text(snapshot.data.documents[index]['covishield'].toString(),style: GoogleFonts.rubik(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w700,),)),
                                                SizedBox(width: 10,),
                                                IconButton(icon: Icon(EvaIcons.checkmarkOutline, color: Colors.white,), onPressed:() async{
                                                  await Firestore.instance.collection("transactions").document(snapshot.data.documents[index].documentID).updateData(
                                                      {
                                                        "status":"1"
                                                      });
                                                  int a=int.parse(snapshot.data.documents[index]['covishield']);

                                                  int  b = int.parse(widget.userDetails.covishield);
                                                  int res = b-a;
                                                  await Firestore.instance.collection("hospitals").document(widget.userDetails.uid).updateData(
                                                      {
                                                          "covishield": res.toString()
                                                      });
                                                  await Firestore.instance.collection("user_details").document(widget.userDetails.uid).collection(widget.userDetails.uid).document(widget.userDetails.uid).updateData(
                                                      {
                                                        "covishield": res.toString()
                                                      });
                                                })
                                              ],
                                            ),
                                            SizedBox(height: 0,),
                                            Row(
                                              children: [
                                                Align(alignment:Alignment.center,child: Text("Covaxin      ",style: GoogleFonts.rubik(fontSize: 15, color: Colors.grey, fontWeight: FontWeight.w700,),)),
                                                SizedBox(width: 30,),
                                                Align(alignment:Alignment.center,child: Text(snapshot.data.documents[index]['covaxin'].toString(),style: GoogleFonts.rubik(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w700,),)),
                                                SizedBox(width: 10,),
                                                IconButton(icon: Icon(EvaIcons.closeOutline, color: Colors.white,), onPressed:() async{
                                                  await Firestore.instance.collection("transactions").document(snapshot.data.documents[index].documentID).updateData(
                                                      {
                                                        "status":"2"
                                                      });
                                                  int a=int.parse(snapshot.data.documents[index]['covaxin']);

                                                  int  b = int.parse(widget.userDetails.covaxin);
                                                  int res = b-a;
                                                  await Firestore.instance.collection("hospitals").document(widget.userDetails.uid).updateData(
                                                      {
                                                        "covaxin": res.toString()
                                                      });
                                                  await Firestore.instance.collection("user_details").document(widget.userDetails.uid).collection(widget.userDetails.uid).document(widget.userDetails.uid).updateData(
                                                      {
                                                        "covaxin": res.toString()
                                                      });
                                                })
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 0,),

                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    Divider(color: Colors.grey,thickness: 0.5, indent: 100,endIndent: 20,),
                                    SizedBox(height: 10,)
                                  ],
                                ),
                              ),
                            )
                                : Container();


                          }
                      );
                    }
                  }
              ),
            ),


            // RaisedButton(
            //   onPressed: () async{
            //
            //     await _auth.signOut();
            //   },
            //   child: Text("Sign out"),
            // ),
          ],
        ),

      )
      )    ,
    );
  }
}
