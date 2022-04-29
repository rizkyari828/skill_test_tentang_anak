import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tama_skill_test/api/api.dart';
import 'package:tama_skill_test/models/response/list_achivement_response.dart';
import 'package:tama_skill_test/modules/home/home.dart';
import 'package:tama_skill_test/routes/routes.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class HomeController extends GetxController {
  final ApiRepository apiRepository;
  HomeController({required this.apiRepository});

  var currentTab = MainTabs.home.obs;
  var listAchivement = <Achivement>[].obs;
  RxBool noInternet = false.obs;

  late MainTab mainTab;
  late SearchView discoverTab;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  @override
  void onInit() async {
    super.onInit();

    mainTab = MainTab();
    topHeadline();
    checkConnectivity();

    discoverTab = SearchView();
  }

  void checkConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      noInternet.value = false;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      noInternet.value = false;
    } else {
      noInternet.value = true;
      EasyLoading.dismiss();
    }
  }

  Future<void> topHeadline() async {
    var res = await apiRepository.getList();
    listAchivement.addAll(res?.data ?? []);
  }

  void switchTab(index) {
    var tab = _getCurrentTab(index);
    currentTab.value = tab;
  }

  Future<void> onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    checkConnectivity();
    listAchivement.clear();
    topHeadline();
    refreshController.refreshCompleted();
  }

  void goToDetailPages(Achivement achivement) {
    Get.toNamed(Routes.DETAIL, arguments: achivement);
  }

  void goToSearchPages() {
    Get.toNamed(Routes.SEARCH);
  }

  int getCurrentIndex(MainTabs tab) {
    switch (tab) {
      case MainTabs.home:
        return 0;
      case MainTabs.discover:
        return 1;
      default:
        return 0;
    }
  }

  MainTabs _getCurrentTab(int index) {
    switch (index) {
      case 0:
        return MainTabs.home;
      case 1:
        return MainTabs.discover;
      default:
        return MainTabs.home;
    }
  }
}
