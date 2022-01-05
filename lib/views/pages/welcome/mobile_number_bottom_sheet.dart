import 'package:cleaner/constants/colors_constants.dart';
import 'package:cleaner/constants/string_constants.dart';
import 'package:cleaner/views/pages/welcome/verify_otp_bottom_sheet.dart';
import 'package:cleaner/views/widgets/button_widget.dart';
import 'package:cleaner/views/widgets/common_text.dart';
import 'package:cleaner/views/widgets/country_code.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MobileNumberBottomSheet extends StatelessWidget {
  const MobileNumberBottomSheet({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {
    bool maxLength;
    final myController = TextEditingController();
    var mobileNumber = '';
    return Padding(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom+30),
      child: Column(mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 32,
              bottom: 14,
            ),
            child: Container(
                child: CommonText().commonInputText(
                    name: StringConstants.ENTER_PHONE_NUMBER,
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: ColorsConstants.DARK_TEXT_COLOR)),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 32),
              child: CommonText().commonInputText(
                  name: StringConstants.SEND_OTP,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: ColorsConstants.LIGHT_TEXT_COLOR)),

          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Container(
              height: 50,
              width: 310,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: ColorsConstants.LIGHT_TEXT_COLOR)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CountryCodePicker(
                    initialSelection: 'IN',
                  ),
                  Expanded(
                    child: TextField(
                      maxLength: 10,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        counterText: '',
                        hintText: StringConstants.MOBILE_NUMBER,
                      ),
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: ColorsConstants.DARK_TEXT_COLOR),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(
            height: 50.h,
          ),

          InkWell(
              onTap: () {
                mobileNumber = myController.text;

                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(32))),
                    context: context,
                    builder: (context) {
                      return VerifyOtpBottomSheet();
                    },
                    isDismissible: true);
              },
              child: BigButton().bigSizeButton(
                name: StringConstants.CONTINUE,
                fontWeight: FontWeight.bold,
                fontSize: 14,
                buttonColor: ColorsConstants.BOX_SHADOW_COLOR,
                shadowColor: ColorsConstants.LIGHT_TEXT_COLOR,
                textColor: ColorsConstants.LIGHT_TEXT_COLOR,
              )),
        ],
      ),
    );
  }
}

