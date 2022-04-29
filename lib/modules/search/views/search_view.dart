import 'package:flutter/material.dart';
import 'package:tama_skill_test/shared/shared.dart';
import 'package:tama_skill_test/shared/widgets/custom_card.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonWidget.appBar(
          context, 'Discover Achivement', ColorConstants.black, true),
        body: Obx(() => controller.noInternet.value == false
            ? _getBody(controller)
            : RequestTimeOut(onPressed: () {
                controller.onRefresh();
              })));
  }

  Widget _getBody(SearchController controller) {
    final sh = SizeConfig().screenHeight;
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, top: 10, right: 15, bottom: 10.0),
              child: CommonWidget.headText(text: 'Discover'),
            ),
            Container(height: sh * .8, child: _getItems(controller)),
          ],
        ),
      ),
    );
  }

  SmartRefresher _getItems(SearchController controller) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      header: WaterDropHeader(),
      controller: controller.refreshController,
      onRefresh: controller.onRefresh,
      onLoading: controller.onLoading,
      child: ListView.builder(
        itemCount: controller.listAchivement.length,
        itemBuilder: (context, i) => InkWell(
          onTap: () {
            controller.goToDetailPages(controller.listAchivement[i]);
          },
          child: CustomCardView(
            title: controller.listAchivement[i].achievementName ?? '',
            date: controller.listAchivement[i].year ?? '',
            description: controller.listAchivement[i].level ?? '',
            image: controller.listAchivement[i].file ?? '',
            author: controller.listAchivement[i].organizer ?? '',
          ),
        ),
      ),
    );
  }
}
