import 'package:flutter/material.dart';
import 'package:tama_skill_test/routes/routes.dart';
import 'package:tama_skill_test/shared/shared.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:tama_skill_test/shared/widgets/button.dart';

import '../../modules/home/home_controller.dart';

class CommonWidget {
  static AppBar appBar(
      BuildContext context, String title, Color color, bool isBack,
      {void Function()? callback}) {
    return AppBar(
      iconTheme: IconThemeData(
        color: Colors.black, //change your color here
      ),
      automaticallyImplyLeading: isBack,
      title: Text(
        title,
        style: TextStyle(color: color, fontFamily: 'Poppins', fontSize: 23),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
    );
  }

  static SizedBox rowHeight({double height = 16}) {
    return SizedBox(height: height);
  }

  static SizedBox rowWidth({double width = 30}) {
    return SizedBox(width: width);
  }

  static Text headText(
      {String text = "",
      Color color = Colors.black87,
      TextAlign align: TextAlign.start}) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
          color: color,
          fontWeight: FontWeight.w600,
          fontSize: 23,
          fontFamily: 'Poppins'),
    );
  }

  static Text minHeadText(
      {String text = "",
      Color color = Colors.black87,
      TextAlign align: TextAlign.start}) {
    return Text(
      text,
      textAlign: align,
      style: TextStyle(
          color: color,
          fontWeight: FontWeight.w600,
          fontSize: 18,
          fontFamily: 'Poppins'),
    );
  }

  static Text subtitleText(
      {String text = "",
      Color color = Colors.black87,
      FontWeight fontWeight = FontWeight.normal}) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontSize: 13,
          letterSpacing: 0.15,
          fontFamily: 'Poppins'),
    );
  }

  static Text minSubtitleText(
      {String text = "",
      Color color = Colors.black87,
      FontWeight fontWeight = FontWeight.normal}) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontWeight: fontWeight,
          fontSize: 12,
          letterSpacing: 0.15,
          fontFamily: 'Poppins'),
    );
  }

  static Text bodyText({String text = "", Color color = Colors.black87}) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontWeight: FontWeight.normal,
          fontSize: 14,
          letterSpacing: 0.5,
          fontFamily: 'Poppins'),
    );
  }

  static Text captionText({String text = "", Color color = Colors.black87}) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontWeight: FontWeight.normal,
          fontSize: 10,
          letterSpacing: 0.4,
          fontFamily: 'Poppins'),
    );
  }

  static Row labelExpanded(
      {String label = "", value = "", Color color = ColorConstants.black}) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            label,
            style: TextStyle(
                color: color,
                fontWeight: FontWeight.normal,
                fontSize: 10,
                letterSpacing: 0.4,
                fontFamily: 'Poppins'),
          ),
        ),
        Expanded(
          child: Text(value,
              style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                  letterSpacing: 0.4,
                  fontFamily: 'Poppins')),
        ),
      ],
    );
  }

  static void toast(String error) async {
    await Fluttertoast.showToast(
      msg: error,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: Colors.white,
      textColor: Colors.black,
      fontSize: 16.0,
    );
  }

  static void errorSnackBar(String error) async {
    Get.snackbar(
      "Error",
      error,
      icon: Icon(Icons.person, color: Colors.white),
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.red,
      borderRadius: 20,
      margin: EdgeInsets.all(15),
      colorText: Colors.white,
      duration: Duration(seconds: 4),
      isDismissible: true,
      // dismissDirection: SnackDismissDirection.HORIZONTAL,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }

  static Widget cardWithShadow(child) {
    final sw = SizeConfig().screenWidth;
    return Container(
      width: sw,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 20.0,
            spreadRadius: 4.0,
            offset: Offset(
              -10.0,
              10.0,
            ),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: child,
      ),
    );
  }

  static Future addSheetBar(
      {HomeController? controller,
      String name = "",
      String qty = "",
      String date = ""}) {
    final sw = SizeConfig().screenWidth;
    return Get.bottomSheet(
        Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Obx(() => Column(
                      children: [
                        SizedBox(height: 10.0),
                        InputField(
                          keyboardType: TextInputType.number,
                          controller: TextEditingController(),
                          placeholder: qty,
                          labelText: "Qty",
                        ),
                        SizedBox(height: 20.0),
                        CustomButton(
                          buttonText: 'SIMPAN',
                          width: sw,
                          onPressed: () {
                            // controller.updateGoods(name: name);
                          },
                        ),
                      ],
                    )),
              )
            ],
          ),
        ),
        elevation: 20.0,
        enableDrag: false,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        )));
  }
}
