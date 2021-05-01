import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospitalapp/models/userdetails.dart';
import 'package:hospitalapp/screens/Otherhospitalpreview.dart';

class Search extends StatefulWidget {
  final UserDetails userDetails;

  const Search({Key key, this.userDetails}) : super(key: key);
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String city='';
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(28, 27, 37, 1),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 16,right: 16),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 40, right: 8, left: 8),
                //color: Colors.grey,
                height: 48,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff575757),
                  border: Border.all(
                    color: Color(0xff575757),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20),
                  ),
                ),
                child: Row(
                  children: [
                    IconButton(icon: Icon(EvaIcons.search,color: Colors.white,), onPressed: null),
                    SizedBox(width: 7,),
                    Expanded(
                      child: TextField(
                        controller: myController,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Search for an city',
                          hintStyle: TextStyle(fontSize: 15.0, color: Colors.white),
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          suffixIcon: IconButton(
                            onPressed: () {
                              myController.clear();
                            },
                            icon: Icon(
                              Icons.clear,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        onSubmitted: (value){
                          setState(() {
                            city=value;
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 8,right: 8),
                child: Divider(color: Colors.white,thickness: 0.15,),
              ),
              SizedBox(height: 0,),

              SizedBox(
                height: 500,
                child: StreamBuilder<QuerySnapshot>(
                  stream: Firestore.instance.collection("hospitals").snapshots(),
                  builder: (context,snapshot){
                    if(!snapshot.hasData){
                        return Image(image: AssetImage('assets/health-meditation.png'));
                    }
                    else{
                      return ListView.builder(
                          itemCount: snapshot.data.documents.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context,int index){
                                return snapshot.data.documents[index]['city'] == city ?
                                InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => OtherHospitalPreview(userDetails: widget.userDetails,city:widget.userDetails.city,myname: widget.userDetails.name, name: snapshot.data.documents[index]['name'], covaxin: snapshot.data.documents[index]['covaxin'], covishield: snapshot.data.documents[index]['covishield'])),
                                  );
                                },
                                child: Container(

                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(width: 20,),
                                          CircleAvatar(radius: 35,),
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
                                      Divider(color: Colors.grey,thickness: 0.5, indent: 100,endIndent: 65,),
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

            ],
          ),
        ),
      ),
    );
  }
}
