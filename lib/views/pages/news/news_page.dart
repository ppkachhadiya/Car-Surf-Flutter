import 'package:cleaner/constants/images_constants.dart';
import 'package:cleaner/constants/size_constants.dart';
import 'package:cleaner/views/pages/welcome/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
      ),
      body: Stack(
        children: [
          Center(
            child: InkWell(
              onTap: (){
                Get.to(WelcomePage());
              },
              child: Text(
                "New Page",
                style: TextStyle(fontSize: SizeConstants.H16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
