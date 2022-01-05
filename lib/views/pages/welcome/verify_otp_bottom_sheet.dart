import 'package:cleaner/constants/colors_constants.dart';
import 'package:cleaner/constants/string_constants.dart';
import 'package:cleaner/views/widgets/button_widget.dart';
import 'package:cleaner/views/widgets/common_text.dart';
import 'package:cleaner/views/widgets/country_code.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class VerifyOtpBottomSheet extends StatelessWidget {
  const VerifyOtpBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 32,
            bottom: 14,
          ),
          child: Container(
              child: CommonText().commonInputText(
                  name: StringConstants.VERIFY_PHONE_NUMBER,
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: ColorsConstants.DARK_TEXT_COLOR)),
        ),
        Container(
            height: 40,
            width: 308,
            child: CommonText().commonInputText(
                name: StringConstants.SENT_OTP,
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: ColorsConstants.LIGHT_TEXT_COLOR)),
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _textFieldOtp(first: true, last: false, context: context),
              _textFieldOtp(first: false, last: false, context: context),
              _textFieldOtp(first: false, last: false, context: context),
              _textFieldOtp(first: false, last: true, context: context),
            ],
          ),
        ),
        InkWell(
            onTap: () {},
            child: BigButton().bigSizeButton(
              name: StringConstants.CONTINUE,
              fontWeight: FontWeight.bold,
              fontSize: 14,
              buttonColor: ColorsConstants.MINT_COLOR,
              shadowColor: ColorsConstants.LIGHT_TEXT_COLOR,
              textColor: ColorsConstants.WHITE_COLOR,
            )),
      ],
    );
  }
}

Widget _textFieldOtp({required bool first, required bool last, context}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: Container(
      child: TextField(

        onChanged: (value) {
          if (value.length == 0 && first == false) {
            FocusScope.of(context).previousFocus();
          }
          if (value.length == 1 && last == false) {
            FocusScope.of(context).nextFocus();
          }
        },
        maxLength: 1,
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24),
        decoration: InputDecoration(
            filled: false,
            border: InputBorder.none,
            fillColor: ColorsConstants.MINT_COLOR,
            counterText: ''),
        keyboardType: TextInputType.number,
      ),
      height: 48,
      width: 48,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: ColorsConstants.OTP_BACKGROUND),
    ),
  );
}
