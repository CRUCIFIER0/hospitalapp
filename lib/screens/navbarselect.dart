import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospitalapp/models/userdetails.dart';
import 'package:hospitalapp/screens/Home.dart';

import 'package:hospitalapp/screens/homeuser.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:hospitalapp/screens/search.dart';
import 'package:hospitalapp/widgets/transaction.dart';
import 'package:ss_bottom_navbar/ss_bottom_navbar.dart';

class NavBarSelect extends StatefulWidget {

  final UserDetails userDetails;

  const NavBarSelect({Key key, this.userDetails}) : super(key: key);

  @override
  _NavBarSelectState createState() => _NavBarSelectState();
}

class _NavBarSelectState extends State<NavBarSelect> {
  int currentIndex = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  final Key complaint = PageStorageKey("My Complaints");
  final Key departmentComplaint = PageStorageKey("Department Complaints");
  int _c=0;





  @override
  Widget build(BuildContext context) {
    final tabu=[
      Homeuser(userDetails: widget.userDetails,),
      Transaction()
    ];
    final tabh=[
      Home(userDetails: widget.userDetails,),
      Search()

    ];

    return Scaffold(
      body: (widget.userDetails.type == 'user') ? tabu[_c]

          : (widget.userDetails.type == 'hospital') ?tabh[_c]
          : Scaffold(
        body: Center(
          child: Container(
            child: Column(
              children: <Widget>[
                Text('The user doesnt exist')
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: (widget.userDetails.type == 'hospital') == true ? BottomNavigationBar(
          currentIndex: _c,
          type: BottomNavigationBarType.fixed,
          backgroundColor:Color.fromRGBO(23, 23, 31, 1) ,
          iconSize: 22,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          selectedFontSize: 10,
          unselectedFontSize: 0,
          items: [
            BottomNavigationBarItem(
                icon: Icon(EvaIcons.home),
              title: Text('.'),

            ),
            BottomNavigationBarItem(
                icon: Icon(EvaIcons.search),
                title: Text('.'),

            ),
            BottomNavigationBarItem(
                icon: Icon(EvaIcons.link2Outline),
                title: Text('.'),
            ),
            BottomNavigationBarItem(
                icon:Icon(EvaIcons.person),
                title: Text('.'),
            )
          ],
        onTap: (index){
            setState(() {
              _c=index;
            });
        },
      ):

      (widget.userDetails.type == 'user') == true ? BottomNavigationBar(
        currentIndex: _c,
        items: [
          BottomNavigationBarItem(
              icon: Icon(EvaIcons.home),
              title: Text('')
          ),
          BottomNavigationBarItem(
              icon: Icon(EvaIcons.search),
              title: Text('')

          ),
          BottomNavigationBarItem(
              icon: Icon(EvaIcons.link2Outline),
              title: Text('')
          ),
          BottomNavigationBarItem(
              icon:Icon(EvaIcons.person),
              title: Text('')
          )
        ],
        onTap: (index){
          setState(() {
            _c=index;
          });
        },
      ) :null

    );
  }
}
