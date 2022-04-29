import 'package:flutter/material.dart';
import 'package:tama_skill_test/modules/home/home.dart';
import 'package:tama_skill_test/shared/shared.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Obx(() => _buildWidget()),
    );
  }

  Widget _buildWidget() {
    return Scaffold(
      body: Center(
        child: _buildContent(controller.currentTab.value),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          _buildNavigationBarItem(
            "Home",
            MainTabs.home == controller.currentTab.value
                ? Icon(
                    Icons.home_rounded,
                    size: 30,
                  )
                : Icon(Icons.home_outlined, size: 30),
          ),
          _buildNavigationBarItem(
            "Discover",
            MainTabs.discover == controller.currentTab.value
                ? Icon(Icons.explore_rounded, size: 30)
                : Icon(Icons.explore_outlined, size: 30),
          ),
        ],
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.grey,
        selectedItemColor: ColorConstants.mainColor,
        currentIndex: controller.getCurrentIndex(controller.currentTab.value),
        selectedLabelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        onTap: (index) => controller.switchTab(index),
      ),
    );
  }

  Widget _buildContent(MainTabs tab) {
    switch (tab) {
      case MainTabs.home:
        return controller.mainTab;
      case MainTabs.discover:
        return controller.discoverTab;
      default:
        return controller.mainTab;
    }
  }

  BottomNavigationBarItem _buildNavigationBarItem(String label, Icon icon) {
    return BottomNavigationBarItem(
      backgroundColor: Colors.white,
      icon: icon,
      label: label,
    );
  }
}
