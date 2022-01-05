import 'package:cleaner/constants/colors_constants.dart';
import 'package:cleaner/constants/string_constants.dart';
import 'package:cleaner/views/widgets/button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'mobile_number_bottom_sheet.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(32))),
            context: context,isScrollControlled: true,
            builder: (context) {
              return MobileNumberBottomSheet();
            },
            isDismissible: true);
      },
      child: BigButton().bigSizeButton(
        name: StringConstants.LOGIN_REGISTER,
        fontWeight: FontWeight.bold,
        fontSize: 14,
        buttonColor: ColorsConstants.WHITE_COLOR,
        textColor: ColorsConstants.DARK_TEXT_COLOR,
        shadowColor: ColorsConstants.BOX_SHADOW_COLOR,
      ),
    );
  }
}
