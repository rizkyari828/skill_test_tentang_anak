import 'dart:async';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tama_skill_test/models/request/list_fruit_request.dart';
import 'package:tama_skill_test/models/response/list_fruit_response.dart';
import 'api.dart';

class ApiRepository {
  ApiRepository({required this.apiProvider});

  final ApiProvider apiProvider;
  final int timeout = 10;

  Future<ListFruitResponse?> getList(ListFruitsRequest data) async {
    try {
      final res = await apiProvider
          .getList('ta/challenges/fruits', data)
          .timeout(Duration(seconds: timeout));
      if (res.statusCode == 200) {
        return ListFruitResponse.fromJson(res.body);
      }
    } on TimeoutException catch (_) {
      EasyLoading.showError('Connection Timeout. Please try again later');
      EasyLoading.dismiss();
    } catch (exception) {
      print(exception);
    }
  }
}
