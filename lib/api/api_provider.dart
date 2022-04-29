import 'package:tama_skill_test/api/base_provider.dart';
import 'package:get/get.dart';
import 'package:tama_skill_test/models/request/create_request.dart';
import 'package:tama_skill_test/models/request/delete_request.dart';
import 'package:tama_skill_test/models/request/update_request.dart';

class ApiProvider extends BaseProvider {
  Future<Response> getList(String path) {
    return get(path);
  }

  Future<Response> update(String path, UpdateRequest data) {
    return post(path, data.toJson());
  }

  Future<Response> destroy(String path, DeleteRequest data) {
    return post(path, data.toJson());
  }

  Future<Response> create(String path, CreateRequest data) {
    return post(path, data.toJson());
  }
}
