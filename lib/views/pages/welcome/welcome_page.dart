import 'package:cleaner/constants/colors_constants.dart';
import 'package:cleaner/constants/string_constants.dart';
import 'package:cleaner/views/widgets/texty_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'background_gif.dart';
import 'login_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            BackGroundGif(),
            Center(
              child: Container(
                height: 24.h,
                width: 151.w,
                child: Image.asset('assets/logo/Logo.png'),
              ),
            ),
            Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    LoginButton(),

                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: TextyButton().buttonAndText(
                      name: StringConstants.SKIP_FOR_NOW,
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: ColorsConstants.WHITE_COLOR),
                ),
              ],
            ))
          ],
        ));
  }
}
