import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospitalapp/screens/Register.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
                Align(alignment:Alignment.topLeft,child: Text("Let's sign you in.",style: GoogleFonts.rubik(fontSize: 35, color: Colors.white, fontWeight: FontWeight.w700,),)),
                SizedBox(height: 15,),
                Align(alignment:Alignment.topLeft,child: Text("Welcome back.",style: GoogleFonts.rubik(fontSize: 28, color: Colors.grey, fontWeight: FontWeight.w500,),)),
                Align(alignment:Alignment.topLeft,child: Text("You've been missed !",style: GoogleFonts.rubik(fontSize: 28, color: Colors.grey, fontWeight: FontWeight.w500,),)),
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
                        onSubmitted: (value){
                          setState(() {

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
                            hintText: 'Password',
                            hintStyle: TextStyle(fontSize: 15.0, color: Colors.white),
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,

                          ),
                          onSubmitted: (value){
                            setState(() {

                            });
                          },
                        ),
                      )
                    ],
                  ),
                ),
            SizedBox(height: 200,),

                Padding(
                  padding: const EdgeInsets.only(left: 45),
                  child: Align(alignment:Alignment.center,child: Row(
                    children: [
                      Text("Don't have an account?   ",style: GoogleFonts.rubik(fontSize: 15, color: Colors.grey, fontWeight: FontWeight.w500,),),
                      InkWell(
                          onTap:() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Register()),
                            );
                          },

                          child: Text("Register",style: GoogleFonts.rubik(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w500,),)

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
                onTap: (){

                },
                child: Container(
                  height: 70,
                  width: 430,
                  //color: Colors.white,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child:  Center(child: Text("Sign In",textAlign: TextAlign.center,style: GoogleFonts.rubik(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700,),)),
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
