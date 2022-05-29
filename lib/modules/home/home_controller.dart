import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tama_skill_test/api/api.dart';
import 'package:tama_skill_test/models/request/list_fruit_request.dart';
import 'package:tama_skill_test/models/response/list_fruit_response.dart';
import 'package:tama_skill_test/modules/home/home.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:tama_skill_test/routes/app_pages.dart';
import 'package:tama_skill_test/shared/shared.dart';

class HomeController extends GetxController {
  final ApiRepository apiRepository;
  HomeController({required this.apiRepository});

  var currentTab = MainTabs.home.obs;
  var datafruits = <Fruit>[].obs;
  var uniquelist = <Fruit>[].obs;
  var imgData = ImagesReferences();

  RxString imgController = ''.obs;
  RxString totalController = ''.obs;
  RxString fruitNameController = ''.obs;
  RxBool noInternet = false.obs;
  RxString uid = ''.obs;

  late MainTab mainTab;
  late MainTab discoverTab;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onInit() async {
    super.onInit();

    mainTab = MainTab();
    loadUsers();
    getFruits();
    checkConnectivity();

    discoverTab = MainTab();
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

  Future<void> getFruits() async {
    DataReference _dataReference =
        DataReference(imageReferences: true, referenceId: '1650165235');
    ListFruitsRequest _request = ListFruitsRequest(
      data: _dataReference,
    );
    var res = await apiRepository.getList(_request);
    datafruits.addAll(res?.data?.fruits ?? []);
    imgData = res?.data?.imagesReferences ?? imgData;

    getTotal();
  }

  void getTotal() {
    uniquelist.clear();
    if (datafruits.isNotEmpty) {
      var seen = Set<String>();
      uniquelist.value =
          datafruits.where((fruit) => seen.add(fruit.name ?? '')).toList();

      for (var unq in uniquelist) {
        String _img = '';

        if (unq.name == 'apple') {
          _img = imgData.apple ?? '';
        } else if (unq.name == 'manggo') {
          _img = imgData.manggo ?? '';
        } else if (unq.name == 'banana') {
          _img = imgData.banana ?? '';
        } else if (unq.name == 'avocado') {
          _img = imgData.avocado ?? '';
        } else if (unq.name == 'melon') {
          _img = imgData.melon ?? '';
        } else {
          _img = '';
        }

        Fruit unqSingleFruit = Fruit(
          name: unq.name,
          price: 0,
          total: 0,
          img: _img,
        );

        uniquelist[
                uniquelist.indexWhere((element) => element.name == unq.name)] =
            unqSingleFruit;
      }

      for (var fruitItem in datafruits) {
        for (var dataFruit in uniquelist) {
          if (fruitItem.name == dataFruit.name) {
            Fruit singleFruit = Fruit(
              name: fruitItem.name,
              price: (fruitItem.price ?? 0) + (dataFruit.price ?? 0),
              total: (dataFruit.total ?? 0) + 1,
              img: dataFruit.img ?? '',
            );

            uniquelist[uniquelist.indexWhere(
                (element) => element.name == dataFruit.name)] = singleFruit;
          }
        }
      }

      Fruit max = uniquelist.first;
      uniquelist.forEach((e) {
        if (e.total! > max.total!) max = e;
      });

      totalController.value = max.total.toString();
      fruitNameController.value = max.name ?? '';
    }
  }

  void clear() {
    datafruits.clear();
    uniquelist.clear();
  }

  void switchTab(index) {
    var tab = _getCurrentTab(index);
    currentTab.value = tab;
  }

  Future<void> onRefresh() async {
    await Future.delayed(Duration(milliseconds: 1000));
    clear();
    checkConnectivity();
    getFruits();

    refreshController.refreshCompleted();
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

  loadUsers() async {
    var prefs = Get.find<SharedPreferences>();
    uid.value = prefs.getString('userInfo') ?? "";
  }

  void dialogTotal() {
    Get.defaultDialog(
      title: "Alert",
      content: CommonWidget.bodyText(
        text: "$fruitNameController total is $totalController",
      ),
      textCancel: 'Close',
    );
  }

  void changePic(img) {
    imgController.value = img;
  }

  Future signOut() async {
    var storage = Get.find<SharedPreferences>();
    try {
      await _auth.signOut();
      storage.clear();
      Get.offAllNamed(Routes.LOGIN);
    } catch (e) {
      print(e);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
