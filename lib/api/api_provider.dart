import 'package:tama_skill_test/api/base_provider.dart';
import 'package:get/get.dart';
import 'package:tama_skill_test/models/request/list_fruit_request.dart';

class ApiProvider extends BaseProvider {
  Future<Response> getList(String path, ListFruitsRequest data) {
    return post(path, data.toJson());
  }
}
