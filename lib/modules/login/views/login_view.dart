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
            InputField(
              isDisabled: true,
              prefixIcon: Icon(
                Icons.person,
                size: 30,
              ),
              controller: TextEditingController(),
              keyboardType: TextInputType.text,
              placeholder: 'Username',
              validator: (value) {
                return null;
              },
            ),
            CommonWidget.rowHeight(),
            InputField(
              isDisabled: true,
              isPassword: true,
              prefixIcon: Icon(
                Icons.vpn_key_rounded,
                size: 30,
              ),
              controller: TextEditingController(),
              keyboardType: TextInputType.emailAddress,
              placeholder: 'Password',
              password: true,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Password is required.';
                }
                if (value.length < 4) {
                  return 'Password should be more then 6 characters';
                }

                return null;
              },
            ),
            CommonWidget.rowHeight(),
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
