import 'package:flutter/material.dart';
import 'package:tama_skill_test/modules/home/home.dart';
import 'package:tama_skill_test/shared/shared.dart';
import 'package:tama_skill_test/shared/widgets/button.dart';
import 'package:tama_skill_test/shared/widgets/custom_card.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MainTab extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonWidget.appBar(
            context, 'Achivement', ColorConstants.black, false),
        body: Obx(() => controller.noInternet.value == false
            ? _getBody(controller)
            : RequestTimeOut(onPressed: () {
                controller.onRefresh();
              })));
  }

  Widget _getBody(HomeController controller) {
    final sh = SizeConfig().screenHeight;
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10.0),
              child: CommonWidget.headText(text: 'For You'),
            ),
            Container(height: sh * .28, child: _getTopHighlight(controller)),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, top: 15, right: 15, bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonWidget.headText(text: 'Top Achivement'),
                  InkWell(
                    onTap: () {
                      controller.goToSearchPages();
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: ColorConstants.backgroundTextField,
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: CommonWidget.subtitleText(text: 'Show All'),
                        )),
                  ),
                ],
              ),
            ),
            Container(height: sh * .5, child: _getItems(controller)),
          ],
        ),
      ),
    );
  }

  SmartRefresher _getItems(HomeController controller) {
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      header: WaterDropHeader(),
      controller: controller.refreshController,
      onRefresh: controller.onRefresh,
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

  Widget _getTopHighlight(HomeController controller) {
    final sw = SizeConfig().screenWidth;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: controller.listAchivement.length,
      itemBuilder: (context, i) => InkWell(
        onTap: () {
          // controller.goToDetailPages(
          //     url: controller.listAchivement[i].url.toString());
        },
        child: Container(
          width: sw * .7,
          margin: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                width: sw * .7,
                height: sw * .7,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      image: new DecorationImage(
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.4), BlendMode.dstATop),
                        image: new NetworkImage(
                          controller.listAchivement[i].file ?? '',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CommonWidget.labelExpanded(
                        color: Colors.white,
                        label: controller.listAchivement[i].organizer ?? '',
                        value: controller.listAchivement[i].year ?? ''),
                    CommonWidget.bodyText(
                        text:
                            controller.listAchivement[i].achievementName ?? '',
                        color: Colors.white),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Future addSheetBar(
      {HomeController? controller,
      String name = "",
      String qty = "",
      String date = ""}) {
    final sw = SizeConfig().screenWidth;
    return Get.bottomSheet(
        Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Obx(() => Column(
                      children: [
                        SizedBox(height: 10.0),
                        InputField(
                          keyboardType: TextInputType.number,
                          controller: TextEditingController(),
                          placeholder: qty,
                          labelText: "Qty",
                        ),
                        SizedBox(height: 20.0),
                        CustomButton(
                          buttonText: 'SIMPAN',
                          width: sw,
                          onPressed: () {
                            // controller.updateGoods(name: name);
                          },
                        ),
                      ],
                    )),
              )
            ],
          ),
        ),
        elevation: 20.0,
        enableDrag: false,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        )));
  }
}
