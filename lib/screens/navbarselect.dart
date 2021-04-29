import 'package:flutter/material.dart';
import 'package:hospitalapp/models/userdetails.dart';
import 'package:hospitalapp/screens/Home.dart';

class NavBarSelect extends StatefulWidget {

  final UserDetails userDetails;

  const NavBarSelect({Key key, this.userDetails}) : super(key: key);

  @override
  _NavBarSelectState createState() => _NavBarSelectState();
}

class _NavBarSelectState extends State<NavBarSelect> {
  final PageStorageBucket bucket = PageStorageBucket();
  final Key complaint = PageStorageKey("My Complaints");
  final Key departmentComplaint = PageStorageKey("Department Complaints");

  int currentIndex = 0;




  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: (widget.userDetails.type == 'user') ? IndexedStack(
        index: currentIndex,
        children: <Widget>[
         Home(userDetails: widget.userDetails,),
        ],
      )

          : (widget.userDetails.type == 'hospital') ? IndexedStack(
        index: currentIndex,
        children: <Widget>[
          Home(userDetails: widget.userDetails,),
        ],
      )
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
      // bottomNavigationBar: (widget.userDetails.authLevel == '0' && widget.userDetails.department == "maintenance") == true ? BottomNavyBar(
      //   selectedIndex: currentIndex,
      //   showElevation: true,
      //   itemCornerRadius: 10,
      //   curve: Curves.easeInBack,
      //   onItemSelected: (index) => setState(() {
      //     currentIndex = index;
      //   }),
      //   items: [
      //     BottomNavyBarItem(
      //       icon: Icon(Icons.message),
      //       title: Text('Complaints'),
      //       activeColor: primaryblue,
      //       inactiveColor: Colors.white,
      //       textAlign: TextAlign.center,
      //     ),
      //     BottomNavyBarItem(
      //       icon: Icon(Icons.account_circle),
      //       title: Text('Profile'),
      //       activeColor: primaryblue,
      //       inactiveColor: Colors.white,
      //       textAlign: TextAlign.center,
      //     ),
      //   ],
      // ) :
      //
      // (widget.userDetails.authLevel == '0' && widget.userDetails.department == "production") == true ? BottomNavyBar(
      //   selectedIndex: currentIndex,
      //   showElevation: true,
      //   itemCornerRadius: 10,
      //   curve: Curves.easeInBack,
      //   onItemSelected: (index) => setState(() {
      //     currentIndex = index;
      //   }),
      //   items: [
      //     BottomNavyBarItem(
      //       icon: Icon(Icons.message),
      //       title: Text('Complaints'),
      //       activeColor: primaryblue,
      //       inactiveColor: Colors.white,
      //       textAlign: TextAlign.center,
      //     ),
      //     BottomNavyBarItem(
      //       icon: Icon(Icons.account_circle),
      //       title: Text('Profile'),
      //       activeColor: primaryblue,
      //       inactiveColor: Colors.white,
      //       textAlign: TextAlign.center,
      //     ),
      //   ],
      // ) :
      // :
      // (widget.userDetails.authLevel == '2' && widget.userDetails.department == "admin") == true ? null : null,
    );
  }
}
