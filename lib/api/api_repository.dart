import 'dart:async';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tama_skill_test/models/models.dart';
import 'package:tama_skill_test/models/request/create_request.dart';
import 'package:tama_skill_test/models/request/delete_request.dart';
import 'package:tama_skill_test/models/request/update_request.dart';
import 'api.dart';

class ApiRepository {
  ApiRepository({required this.apiProvider});

  final ApiProvider apiProvider;
  final int timeout = 10;

  Future<ListAchivementResponse?> getList() async {
    try {
      final res = await apiProvider
          .getList('api/user/achievement')
          .timeout(Duration(seconds: timeout));
      if (res.statusCode == 200) {
        return ListAchivementResponse.fromJson(res.body);
      }
    } on TimeoutException catch (_) {
      EasyLoading.showError('Connection Timeout. Please try again later');
      EasyLoading.dismiss();
    } catch (exception) {
      print(exception);
    }
  }

  Future<ErrorResponse?> createData(CreateRequest data) async {
    try {
      final res = await apiProvider
          .create('api/user/achievement/create', data)
          .timeout(Duration(seconds: timeout));
      if (res.statusCode == 200 || res.statusCode == 401) {
        return ErrorResponse.fromJson(res.body);
      }
    } on TimeoutException catch (_) {
      EasyLoading.showError('Connection Timeout. Please try again later');
      EasyLoading.dismiss();
    } catch (exception) {
      print(exception);
    }
  }

  Future<ErrorResponse?> updateData(UpdateRequest data) async {
    try {
      final res = await apiProvider
          .update('api/user/achievement/update', data)
          .timeout(Duration(seconds: timeout));
      if (res.statusCode == 200 || res.statusCode == 401) {
        return ErrorResponse.fromJson(res.body);
      }
    } on TimeoutException catch (_) {
      EasyLoading.showError('Connection Timeout. Please try again later');
      EasyLoading.dismiss();
    } catch (exception) {
      print(exception);
    }
  }

  Future<ErrorResponse?> destroyData(DeleteRequest data) async {
    try {
      final res = await apiProvider
          .destroy('api/user/achievement/destroy', data)
          .timeout(Duration(seconds: timeout));
      if (res.statusCode == 200 || res.statusCode == 401) {
        return ErrorResponse.fromJson(res.body);
      }
    } on TimeoutException catch (_) {
      EasyLoading.showError('Connection Timeout. Please try again later');
      EasyLoading.dismiss();
    } catch (exception) {
      print(exception);
    }
  }
}
