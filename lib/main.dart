import 'dart:async';
import 'package:cleaner/constants/string_constants.dart';
import 'package:cleaner/views/pages/news/news_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'constants/colors_constants.dart';
import 'controller/bindings/app_bindings.dart';
import 'views/pages/welcome/welcome_page.dart';


Future<void> main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  StreamSubscription? _sub;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(400, 770),
      builder: () {
        return GetMaterialApp(
          title: StringConstants.TITLE,
          debugShowCheckedModeBanner: false,
          initialBinding: AppBinding(),
          locale: Locale("en", "US"),
          themeMode: ThemeMode.system,
          theme: ThemeData(
            primaryColor: ColorsConstants.PRIMARY_COLOR,
            accentColor: ColorsConstants.ACCENT_COLOR,
            fontFamily: 'Montserrat',
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: WelcomePage(),
          // home: ExamplePage(),
        );
      },
    );
  }
}
