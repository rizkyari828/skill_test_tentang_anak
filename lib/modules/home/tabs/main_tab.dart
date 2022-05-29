import 'package:flutter/material.dart';
import 'package:tama_skill_test/modules/home/home.dart';
import 'package:tama_skill_test/shared/shared.dart';
import 'package:get/get.dart';
import 'package:tama_skill_test/shared/widgets/button.dart';

class MainTab extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonWidget.appBar(
            context, 'My Fruits', ColorConstants.black, false),
        body: Obx(() => controller.noInternet.value == false
            ? _getBody(controller)
            : RequestTimeOut(onPressed: () {
                controller.onRefresh();
              })));
  }

  Widget _getBody(HomeController controller) {
    final sh = SizeConfig().screenHeight;
    final sw = SizeConfig().screenWidth;
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, bottom: 10.0, top: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CommonWidget.headText(text: 'Hai, '),
                      CommonWidget.bodyText(text: controller.uid.value),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: sw * .01),
                    child: CustomButton(
                      height: 40,
                      buttonColor: Colors.red,
                      buttonText: 'LOGOUT',
                      width: sw / 2.5,
                      onPressed: () {
                        controller.signOut();
                      },
                    ),
                  ),
                ],
              ),
            ),
            _getTable(),
            SizedBox(height: sh * .01),
            _cardImg('', controller.dialogTotal),
            SizedBox(height: sw * .01),
            Obx(() => Padding(
                  padding: EdgeInsets.all(sw * .03),
                  child: Column(
                    children: [
                      CustomButton(
                        isDisabled: controller.totalController.value == ''
                            ? true
                            : false,
                        buttonColor: Colors.green,
                        buttonText: 'MOST DUPLICATE',
                        width: sw,
                        onPressed: () {
                          controller.dialogTotal();
                        },
                      ),
                      SizedBox(height: sw * .01),
                      controller.totalController.value == ''
                          ? CommonWidget.captionText(
                              text: 'Choose your fruit first',
                              color: Colors.red)
                          : Container(),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _cardImg(img, onPressed) {
    return Obx(() => Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 20.0,
                  spreadRadius: 4.0,
                  offset: Offset(
                    -10.0,
                    10.0,
                  ),
                ),
              ],
            ),
            width: SizeConfig().screenWidth,
            height: SizeConfig().screenHeight * .3,
            child: InkWell(
              onTap: () {
                onPressed();
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: SizeConfig().screenWidth * .3,
                  height: SizeConfig().screenHeight * .3,
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: controller.imgController.value == ''
                          ? Icon(Icons.image_not_supported_rounded,
                              color: Colors.black87, size: 100)
                          : Image.network(controller.imgController.value)),
                ),
              ),
            ),
          ),
        ));
  }

  Widget _getTable() {
    final sw = SizeConfig().screenWidth;
    final sh = SizeConfig().screenHeight;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 20.0,
                  spreadRadius: 4.0,
                  offset: Offset(
                    -10.0,
                    10.0,
                  ),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.blue.shade50,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonWidget.subtitleText(text: 'Table of'),
                            CommonWidget.minHeadText(text: 'Fruits'),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            controller.onRefresh();
                          },
                          child: Container(
                            decoration: new BoxDecoration(
                              color: ColorConstants.mainColor,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  blurRadius: 20.0,
                                  spreadRadius: 4.0,
                                  offset: Offset(
                                    -10.0,
                                    10.0,
                                  ),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.refresh_rounded,
                                color: Colors.white,
                                size: 20.0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.blue.shade200,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              width: sw * .18,
                              child: CommonWidget.minSubtitleText(
                                  text: 'Name', fontWeight: FontWeight.bold)),
                          SizedBox(
                            width: sw * .01,
                          ),
                          Container(
                              width: sw * .2,
                              child: CommonWidget.minSubtitleText(
                                  text: 'Total', fontWeight: FontWeight.bold)),
                          SizedBox(
                            width: sw * .01,
                          ),
                          Container(
                              width: sw * .12,
                              child: CommonWidget.minSubtitleText(
                                  text: 'Price', fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                ),
                Obx(() => Container(
                      height: sh * .50,
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.uniquelist.length,
                          itemBuilder: (context, i) => Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 5.0,
                                    left: 10.0,
                                    right: 10.0,
                                    top: 5.0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            controller.changePic(
                                                controller.uniquelist[i].img);
                                          },
                                          child: Container(
                                            width: sw * .18,
                                            child: CommonWidget.minSubtitleText(
                                                color: Colors.blue[700] ??
                                                    Colors.black,
                                                text: controller
                                                        .uniquelist[i].name ??
                                                    ''),
                                          ),
                                        ),
                                        SizedBox(
                                          width: sw * .01,
                                        ),
                                        Container(
                                          width: sw * .2,
                                          child: CommonWidget.minSubtitleText(
                                              text: controller
                                                  .uniquelist[i].total
                                                  .toString()),
                                        ),
                                        SizedBox(
                                          width: sw * .01,
                                        ),
                                        Container(
                                          width: sw * .12,
                                          child: CommonWidget.minSubtitleText(
                                              text: controller
                                                  .uniquelist[i].price
                                                  .toString()),
                                        ),
                                        SizedBox(
                                          width: sw * .01,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: sw * .02,
                                    ),
                                    Divider(
                                      color: ColorConstants.borderColor,
                                    ),
                                  ],
                                ),
                              )),
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
