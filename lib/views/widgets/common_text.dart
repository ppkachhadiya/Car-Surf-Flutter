import 'package:cleaner/constants/colors_constants.dart';
import 'package:cleaner/constants/size_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonText{
  CommonInputText({
    required String name,
    required double fontSize,
    required fontWeight,
    fontFamily = 'Montserrat',
    required color,
}){
    return Text(name,style: TextStyle(fontSize: fontSize,
        fontWeight: fontWeight,color: color),);
  }
}

