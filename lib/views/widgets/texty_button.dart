import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextyButton {
  buttonAndText ({
    required String name,
    required double fontSize,
    required fontWeight,
    fontFamily = 'Montserrat',
    required color,
  }){
    return TextButton(onPressed: (){}, child: Text(name,style: TextStyle(fontSize: fontSize,
        fontWeight: fontWeight,color: color),));
  }
}