import 'package:flutter/material.dart';

import 'hextoint.dart';




  Color primary = Color.fromRGBO(28, 40, 51, 0.8);
  Color secondary = Colors.black;
  Color primaryButtonColor =   Colors.orangeAccent; //HexColor("e74c3c");
  Color secondaryButtonColor = HexColor("212f3c");


  TextStyle headlines = TextStyle(letterSpacing: 2.0,fontSize: 15, color: HexColor("d3d3d3"),decoration:TextDecoration.none);
  TextStyle boldNumber = TextStyle(color: HexColor("fbfbfb"), fontWeight: FontWeight.bold,fontSize: 50.0,decoration:TextDecoration.none);
  TextStyle secondaryButtonColorStyle = TextStyle(color: secondaryButtonColor, fontWeight: FontWeight.bold,fontSize: 26.0,decoration:TextDecoration.none);
  TextStyle primaryButtonStyle = TextStyle( fontSize: 18, fontWeight: FontWeight.normal, letterSpacing: 1,wordSpacing: 2, color: secondaryButtonColor,decoration:TextDecoration.none);
  TextStyle resultNumber = TextStyle(color: HexColor("fbfbfb"), fontWeight: FontWeight.bold,fontSize: 80.0,letterSpacing: 0.1,decoration:TextDecoration.none);


