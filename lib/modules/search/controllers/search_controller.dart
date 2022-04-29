import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tama_skill_test/api/api.dart';
import 'package:tama_skill_test/models/models.dart';
import 'package:tama_skill_test/routes/routes.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SearchController extends GetxController {
  final ApiRepository apiRepository;
  SearchController({required this.apiRepository});
  var listAchivement = <Achivement>[].obs;
  RxBool noInternet = false.obs;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  final searchNameController = TextEditingController();
  DateTime datePublish = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day - 1);

  @override
  void onInit() {
    super.onInit();
    checkConnectivity();
  }

  @override
  void onReady() {
    super.onReady();
    searchNews();
    checkConnectivity();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void submitSeach(value) {
    searchNameController.text = value;
    searchNews();
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

  Future<void> searchNews() async {
    listAchivement.clear();
    var res = await apiRepository.getList();
    listAchivement.addAll(res?.data ?? []);
  }

  void onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    var res = await apiRepository.getList();
    listAchivement.addAll(res?.data ?? []);
    refreshController.loadComplete();
  }

  Future<void> onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    checkConnectivity();
    listAchivement.clear();
    searchNews();
    refreshController.refreshCompleted();
  }

  void goToDetailPages(Achivement achivement) {
    Get.toNamed(Routes.DETAIL, arguments: achivement);
  }
}
