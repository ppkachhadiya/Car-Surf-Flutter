
import 'package:cleaner/constants/colors_constants.dart';
import 'package:cleaner/constants/string_constants.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountryCode extends StatelessWidget {
  const CountryCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 311,
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
            child: TextField(maxLength: 10,

              decoration: InputDecoration(border: InputBorder.none, counterText: '',
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
    );
  }
}
