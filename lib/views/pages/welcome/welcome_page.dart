import 'package:cleaner/constants/colors_constants.dart';
import 'package:cleaner/constants/images_constants.dart';
import 'package:cleaner/views/pages/news/news_page.dart';
import 'package:cleaner/views/widgets/button_widget.dart';
import 'package:cleaner/views/widgets/common_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
        body: Stack(
          children: [
            Positioned(child: BackGroundGif()),

            Center(child: Container(height: 24.h,width: 151.w,child: Image.asset('assets/logo/Logo.png'),),),

            Positioned(bottom: 88,left: 40,
              child: BigButton1().BigWhiteButton(name: 'Login/Register',
                  fontWeight: FontWeight.bold, fontSize: 14, color: ColorsConstants.DARK_TEXT_COLOR),),

            Positioned(bottom: 32,left: 88,
              child: Container(height: 24,width: 199,
                child: Center(
                  child: Positioned(bottom: 32,
                      child: TextButton(onPressed: () {  },
                      child: CommonText().CommonInputText(name: 'Skip for Now', fontSize: 14,
                          fontWeight: FontWeight.bold, color: ColorsConstants.WHITE_COLOR)),
                ),
              ),
            ),)


          ],
        )
    );
  }
}



class BackGroundGif extends StatelessWidget {
  const BackGroundGif({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(height: double.infinity,width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/Image4.jpg"),
                fit: BoxFit.cover)
        ),
      ),
    );
  }
}
