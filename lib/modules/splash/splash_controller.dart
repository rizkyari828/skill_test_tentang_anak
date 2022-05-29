import 'package:tama_skill_test/routes/routes.dart';
import 'package:tama_skill_test/shared/shared.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  @override
  void onReady() async {
    super.onReady();

    await Future.delayed(Duration(milliseconds: 2000));
    var storage = Get.find<SharedPreferences>();
    try {
      if (storage.getString(StorageConstants.token) != null) {
        Get.toNamed(Routes.LOGIN);
      } else {
        Get.toNamed(Routes.LOGIN);
      }
    } catch (e) {
      Get.toNamed(Routes.LOGIN);
    }
  }
}
