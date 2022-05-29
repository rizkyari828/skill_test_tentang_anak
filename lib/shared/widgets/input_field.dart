import 'package:flutter/material.dart';
import 'package:tama_skill_test/shared/constants/colors.dart';
import 'package:tama_skill_test/shared/constants/common.dart';

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String labelText;
  final String placeholder;
  final bool? isPassword;
  final Color color;
  final double fontSize;
  final bool password;
  final String? Function(String?)? validator;
  final Widget? prefixIcon, suffixIcon;
  final bool? isError;
  final bool? textObscured;
  final Function()? onVisibilityPressed;
  final isDisabled;

  InputField({
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.labelText = '',
    this.placeholder = '',
    this.color = Colors.white,
    this.fontSize = CommonConstants.bodyText,
    this.password = false,
    this.validator,
    this.prefixIcon = const Icon(Icons.person),
    this.suffixIcon = const Icon(
      Icons.error_outline,
      size: 30,
      color: Color.fromRGBO(255, 0, 0, 1.0),
    ),
    this.isPassword = false,
    this.isError = false,
    this.textObscured = true,
    this.onVisibilityPressed,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: ColorConstants.backgroundTextField,
      elevation: 0.1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: TextFormField(
        readOnly: isDisabled,
        enableInteractiveSelection: isDisabled,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffix: isError ?? false
              ? Icon(
                  Icons.error_outline,
                  size: 25,
                  color: Color.fromRGBO(255, 0, 0, 1.0),
                )
              : null,
          suffixIcon: _suffixIcon(),
          focusedBorder: new OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: new BorderSide(
                  color: isError ?? false ? Colors.red : color, width: 1.0)),
          enabledBorder: new OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
              borderSide: new BorderSide(
                  color: isError ?? false ? Colors.red : color, width: 1.0)),
          hintText: this.placeholder,
          hintStyle: TextStyle(
            fontSize: fontSize,
            // color: color,
            fontWeight: FontWeight.normal,
          ),
          // floatingLabelBehavior: FloatingLabelBehavior.always,
          // labelStyle: TextStyle(
          //   fontSize: fontSize - 2,
          //   color: color,
          //   height: 0.2,
          //   fontWeight: FontWeight.normal,
          // ),
        ),
        controller: this.controller,
        style: TextStyle(
          // color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.normal,
        ),
        keyboardType: this.keyboardType,
        obscureText: _showPassword(),
        autocorrect: false,
        validator: this.validator,
      ),
    );
  }

  Widget? _suffixIcon() {
    if (isPassword ?? false) {
      return IconButton(
        onPressed: isPassword ?? false ? onVisibilityPressed : null,
        icon: textObscured ?? false
            ? Icon(
                Icons.visibility_off,
              )
            : Icon(
                Icons.visibility,
              ),
      );
    }
    return isError ?? false ? suffixIcon : null;
  }

  bool _showPassword() {
    if (isPassword ?? false) {
      return textObscured ?? false;
    }
    return false;
  }
}
