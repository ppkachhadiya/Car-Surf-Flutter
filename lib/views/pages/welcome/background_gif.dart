import 'package:flutter/cupertino.dart';

class BackGroundGif extends StatelessWidget {
  const BackGroundGif({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/Image4.jpg"),
                fit: BoxFit.cover)),
      ),
    );
  }
}
