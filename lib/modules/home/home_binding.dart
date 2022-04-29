import 'package:tama_skill_test/modules/search/controllers/search_controller.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
        () => HomeController(apiRepository: Get.find()));
    Get.lazyPut<SearchController>(
        () => SearchController(apiRepository: Get.find()));
  }
}
