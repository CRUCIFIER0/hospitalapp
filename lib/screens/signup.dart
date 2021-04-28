import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospitalapp/screens/Register.dart';
import 'package:hospitalapp/screens/SignIn.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(28, 27, 37, 0.8) ,
      body: Container(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Image(image: AssetImage('assets/health-vitamins-suplements.png')),
            ),
            SizedBox(height: 30,),
            Text("Bringing your \nmedicines closer",textAlign: TextAlign.center,style: GoogleFonts.rubik(fontSize: 35, color: Colors.white, fontWeight: FontWeight.w700,),),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(left: 45, right: 40),
              child: Text("Bringing closer your medicines, vaccines and everything you can wish for to stay safe in this pandemic. ",textAlign: TextAlign.center,style: TextStyle(fontFamily: 'PublicaSans', fontSize: 16,color: Colors.grey),),
            ),

            SizedBox(height: 70,),
            Container(

              margin: EdgeInsets.only(left: 30,right: 30),
              decoration: BoxDecoration(
                  color: Color(0xff444447),
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),

              child: Row(children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Register()),
                        );
                      },
                      child: Container(
                        height: 70,
                        width: 170,
                        //color: Colors.white,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        child:  Center(child: Text("Register",textAlign: TextAlign.center,style: GoogleFonts.rubik(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700,),)),
                      ),
                    ),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignIn()),
                      );
                    },
                    child: Container(
                          height: 70,
                          width: 155,
                          child:  Center(child: Text("Sign In",style: GoogleFonts.rubik(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w700,),)),

                      ),
                  )

              ],),
            )

          ],
        ),
      ),
    );
  }
}
