import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tama_skill_test/shared/widgets/button.dart';

import '../../../shared/shared.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('Skill Test',
                  style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      color: ColorConstants.mainColor,
                      letterSpacing: 0.4,
                      fontFamily: 'Poppins')),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 35.0),
                child: _buildForms(context),
              ),
              CommonWidget.rowHeight(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForms(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonWidget.rowHeight(height: 32),
            CustomButton(
              buttonText: 'SIGN IN ANONYMOUSLY',
              width: MediaQuery.of(context).size.width,
              onPressed: () {
                controller.signInAnonymously();
              },
            ),
          ],
        ),
      ),
    );
  }
}
