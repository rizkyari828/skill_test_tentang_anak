import 'package:flutter/material.dart';
import 'package:tama_skill_test/shared/widgets/button.dart';

import '../shared.dart';

class RequestTimeOut extends StatelessWidget {
  final VoidCallback onPressed;

  const RequestTimeOut({Key? key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final sw = SizeConfig().screenWidth;
    return Scaffold(
        body: Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.wifi_off_rounded,
                size: 130, color: ColorConstants.mainColor),
            Text('Whoops !',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Poppins',
                  color: Colors.black54,
                )),
            CommonWidget.rowHeight(),
            Text(
              'You Are not connected to the Internet.\nPlease check your Internet connection.',
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w600,
                fontSize: 12,
                fontFamily: 'Poppins',
              ),
            ),
            CommonWidget.rowHeight(),
            CustomButton(
              buttonText: 'TRY AGAIN',
              width: sw * .6,
              onPressed: onPressed,
            )
          ],
        ),
      ),
    ));
  }
}
