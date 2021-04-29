
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff00df55),
      child: Center(
        child: SpinKitChasingDots(
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}