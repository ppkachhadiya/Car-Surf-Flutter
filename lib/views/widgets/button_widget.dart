

import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:cleaner/constants/colors_constants.dart';
import 'package:cleaner/constants/size_constants.dart';
import 'package:cleaner/views/widgets/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonWidget extends StatelessWidget {
  final isOutline;
  final labelText;
  final onCallback;
  final focusNode;
  final color;
  final padding;
  final width;
  final height;
  final fontSize;
  final fontWeight;

  ButtonWidget(
      {this.isOutline = false,
      this.labelText,
      this.onCallback,
      this.width,
      this.height,
      this.fontSize,
      this.fontWeight,
      this.padding,
      this.color,
      this.focusNode});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (width == null) ? double.infinity : width,
      height: (height == null) ? 55.sp : height,
      child: TextButton(
        focusNode: focusNode,
        style: TextButton.styleFrom(
            padding: (padding == null)
                ? EdgeInsets.symmetric(horizontal: 17.sp, vertical: 17.sp)
                : padding,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.sp)),
                side: BorderSide(
                    width: 1.5.sp,
                    color: (color == null)
                        ? ColorsConstants.PRIMARY_COLOR
                        : color)),
            backgroundColor: isOutline
                ? ColorsConstants.WHITE_COLOR
                : (color == null)
                    ? ColorsConstants.PRIMARY_COLOR
                    : color),
        onPressed: onCallback,
        child: Text(labelText,
            style: TextStyle(
                color: isOutline
                    ? (color == null)
                        ? ColorsConstants.PRIMARY_COLOR
                        : color
                    : ColorsConstants.WHITE_COLOR,
                fontSize: (fontSize == null) ? SizeConstants.H16 : fontSize,
                fontWeight:
                    (fontWeight == null) ? FontWeight.w700 : fontWeight)),
      ),
    );
  }
}


class CommonBigButton extends StatefulWidget {
  const CommonBigButton({Key? key}) : super(key: key);

  @override
  _CommonBigButtonState createState() => _CommonBigButtonState();
}

class _CommonBigButtonState extends State<CommonBigButton> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 311,height: 56,
      decoration: BoxDecoration(color: Colors.teal ,borderRadius: BorderRadius.circular(5)),

    );
  }
}


class BigButton{
  bigSizeButton({
    required String name,
    required fontWeight,
    required double fontSize,
    fontFamily = 'Montserrat',
    required textColor ,
    required buttonColor,
    required shadowColor,

  }){
    return Container(width: 311,height: 56,
      child: Center(
          child: Text(name,
            style: TextStyle(fontSize: fontSize,fontWeight: fontWeight,
      color: textColor),)
      ),
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: shadowColor,offset: Offset(0,4))],
          borderRadius: BorderRadius.circular(16),
          color: buttonColor),
      );
  }
}



