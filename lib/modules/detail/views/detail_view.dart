import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tama_skill_test/models/models.dart';
import 'package:tama_skill_test/shared/shared.dart';
import 'package:tama_skill_test/shared/widgets/button.dart';
import 'package:tama_skill_test/shared/widgets/image_picker.dart';
import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  final data = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidget.appBar(
          context, 'Detail Achivement', ColorConstants.black, true),
      body: _getBody(context, controller),
    );
  }

  Widget _getBody(context, DetailController controller) {
    final sh = SizeConfig().screenHeight;
    final sw = SizeConfig().screenWidth;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding:
              const EdgeInsets.only(left: 15, top: 10, right: 15, bottom: 10.0),
          child: CommonWidget.headText(
              text: controller.achivement.achievementName ?? ''),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  editSheetBar(
                      context: context, controller: controller, data: data);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.orange,
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
                  width: sw * .4,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: CommonWidget.subtitleText(
                        text: 'EDIT', color: Colors.white),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  _confirmDialog(
                      'delete', controller.achivement.id ?? 0, controller);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
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
                  width: sw * .4,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: CommonWidget.subtitleText(
                        text: 'DELETE', color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
          height: sh * .50,
          width: sw,
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
            children: [
              CommonWidget.rowHeight(height: 10.0),
              Container(
                width: sw * .3,
                height: sw * .3,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      image: new DecorationImage(
                        fit: BoxFit.cover,
                        image: new NetworkImage(
                          controller.achivement.file ?? '-',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              CommonWidget.rowHeight(height: 10.0),
              CommonWidget.subtitleText(
                  text: controller.achivement.level ?? ''),
              CommonWidget.rowHeight(height: 10.0),
              CommonWidget.subtitleText(
                  text: controller.achivement.organizer ?? ''),
              CommonWidget.rowHeight(height: 10.0),
              CommonWidget.subtitleText(text: controller.achivement.year ?? ''),
              CommonWidget.rowHeight(height: 10.0),
            ],
          ),
        ),
      ],
    );
  }

  void _confirmDialog(String type, int id, DetailController controller) {
    Get.defaultDialog(
      title: "WARNING",
      content: CommonWidget.bodyText(
        text:
            "Are you sure want to ${type == 'delete' ? 'delete' : 'edit'} this data?",
      ),
      textConfirm: "YES",
      textCancel: 'CANCLE',
      onCancel: () {
        Get.back();
      },
      onConfirm: () {
        controller.destroy();
        Get.back();
      },
    );
  }

  static Future editSheetBar(
      {context, DetailController? controller, Achivement? data}) {
    final sw = SizeConfig().screenWidth;
    return Get.bottomSheet(
        Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InputField(
                          keyboardType: TextInputType.text,
                          controller: controller!.achivementNameController,
                          placeholder: "Achivement Name",
                          labelText: "Achivement Name",
                        ),
                        CommonWidget.rowHeight(height: 10.0),
                        InputField(
                          keyboardType: TextInputType.text,
                          controller: controller.organizerController,
                          placeholder: "Organizer",
                          labelText: "Organizer",
                        ),
                        CommonWidget.rowHeight(height: 10.0),
                        InputField(
                          keyboardType: TextInputType.text,
                          controller: controller.levelController,
                          placeholder: "Level",
                          labelText: "Level",
                        ),
                        CommonWidget.rowHeight(height: 10.0),
                        InputField(
                          keyboardType: TextInputType.text,
                          controller: controller.yearController,
                          placeholder: "Year",
                          labelText: "Year",
                        ),
                        CommonWidget.rowHeight(height: 10.0),
                        SizedBox(height: 5.0),
                        Container(
                          child: MaterialButton(
                            onPressed: () {
                              controller.onImageButtonPressed(
                                  ImageSource.camera,
                                  context: context);
                            },
                            color: ColorConstants.backgroundTextField,
                            child: Container(
                              height: 15,
                              width: sw,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.camera_alt,
                                    color: Colors.grey,
                                    size: 30,
                                  ),
                                  SizedBox(width: 10.0),
                                  CommonWidget.bodyText(
                                      text: "Ambil Photo", color: Colors.grey),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Obx(() =>
                              CustomImagePicker.previewGridImages(controller)),
                        ),
                        CommonWidget.rowHeight(height: 10.0),
                        CustomButton(
                          buttonText: 'SIMPAN',
                          width: sw,
                          onPressed: () {
                            controller.editData();
                          },
                        ),
                      ],
                    )),
              ],
            ),
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
