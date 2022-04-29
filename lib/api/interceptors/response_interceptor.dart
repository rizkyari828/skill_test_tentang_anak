import 'dart:async';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tama_skill_test/models/response/error_response.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

FutureOr<dynamic> responseInterceptor(
    Request request, Response response) async {
  EasyLoading.dismiss();

  if (response.statusCode == 200 || response.statusCode == 403) {
  } else {
    print(response);
    handleErrorStatus(response);
    return;
  }

  return response;
}

void handleErrorStatus(Response response) {
  if (response.statusCode == 400) {
    final message = ErrorResponse.fromJson(response.body);
    EasyLoading.showError(message.message + '\nPlease try again later');
    return;
  } else if (response.statusCode == 401) {
    final message = ErrorResponse.fromJson(response.body);
    EasyLoading.showError(message.message + '\nPlease try again later');
    return;
  } else {
    EasyLoading.showError('Error occured. Please try again later');
    return;
  }
}
