import 'package:flutter/material.dart';
import 'package:untitled1/Pages/ItemAddPage.dart';

import '../constants/constants.dart';


class GetStartedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      height: 45.0,
      width: 140.0,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(27.0),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ItemAddPage()),
          );
          //? do something
        },
        color: Colors.orange,
        child: Center(
            child: Padding(
          padding: EdgeInsets.only(top: 12.0, bottom: 12.0),
          child: Text(
            "GET STARTED",
            style: TextStyle(
              fontFamily: Constants.POPPINS,
              fontWeight: FontWeight.w700,
              fontSize: 13.0,
              color: Colors.white,
              letterSpacing: 0.5,
            ),
          ),
        )),
      ),
    );
  }
}
