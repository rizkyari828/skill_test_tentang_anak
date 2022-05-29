import 'package:flutter/material.dart';
import 'package:tama_skill_test/shared/shared.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Skill Test',
              style: TextStyle(
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold,
                  color: ColorConstants.mainColor,
                  letterSpacing: 0.4,
                  fontFamily: 'Poppins')),
          CommonWidget.captionText(text: 'Develop & Design by'),
          CommonWidget.bodyText(text: 'Rizky Ari Pratama'),
        ],
      ),
    );
  }
}
