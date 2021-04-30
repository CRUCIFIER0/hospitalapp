import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(28, 27, 37, 1),
      body: Container(
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


          ],
        ),
      ),
    );
  }
}
