import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospitalapp/screens/SignIn.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  String user='';
  String pass='';
  String city='';
  String type='';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(28, 27, 37, 0.8) ,
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.only(left: 24,right: 22),
              child: Column(
                children: [
                  SizedBox(height: 70,),
                  Align(alignment:Alignment.topLeft,child: Text("Let's sign you up.",style: GoogleFonts.rubik(fontSize: 35, color: Colors.white, fontWeight: FontWeight.w700,),)),
                  Container(
                    margin: EdgeInsets.only(top: 40, right: 8, left: 8),
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
                              hintText: 'Phone, email or username',
                              hintStyle: TextStyle(fontSize: 15.0, color: Colors.white),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                            ),
                            onChanged: (val){
                              setState(() {
                                user=val;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, right: 8, left: 8),
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
                          child: TextFormField(
                            obscureText: true,
                            //controller: myController,
                            style: TextStyle(fontSize: 16, color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'Password',
                              hintStyle: TextStyle(fontSize: 15.0, color: Colors.white),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,

                            ),
                            onChanged: (val){
                              setState(() {
                                pass=val;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, right: 8, left: 8),
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
                              hintText: 'City',
                              hintStyle: TextStyle(fontSize: 15.0, color: Colors.white),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,

                            ),
                            onChanged: (val){
                              setState(() {
                                city=val;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, right: 8, left: 8),
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
                              hintText: 'Are you a "hospital" or "user"?',
                              hintStyle: TextStyle(fontSize: 15.0, color: Colors.white),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,

                            ),
                            onChanged: (val){
                              setState(() {
                                type=val;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 130,),

                  Padding(
                    padding: const EdgeInsets.only(left: 45),
                    child: Align(alignment:Alignment.center,child: Row(
                      children: [
                        Text("Already have an account?   ",style: GoogleFonts.rubik(fontSize: 15, color: Colors.grey, fontWeight: FontWeight.w500,),),
                        InkWell(
                            onTap:() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SignIn()),
                              );
                            },

                            child: Text("Sign In",style: GoogleFonts.rubik(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w500,),)

                        ),
                      ],
                    )),
                  ),
                  SizedBox(height: 30,),
                  Container(

                    margin: EdgeInsets.only(left: 10,right: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: InkWell(
                      onTap: () async{
                        print(user);
                        print(city);
                        print(pass);
                        print(type);
                      },
                      child: Container(
                        height: 70,
                        width: 430,
                        //color: Colors.white,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        child:  Center(child: Text("Sign Up",textAlign: TextAlign.center,style: GoogleFonts.rubik(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700,),)),
                      ),
                    ),
                  ),




                ],
              )
          ),
        )
    );
  }
}
