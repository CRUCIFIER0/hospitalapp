
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(28, 27, 37, 1),
      child: Center(
        child: SpinKitChasingDots(
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}