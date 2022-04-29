import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tama_skill_test/shared/constants/colors.dart';
import 'package:tama_skill_test/shared/utils/common_widget.dart';
import 'package:tama_skill_test/shared/utils/size_config.dart';
import 'package:tama_skill_test/shared/widgets/button.dart';
import 'package:tama_skill_test/shared/widgets/image_picker.dart';
import 'package:tama_skill_test/shared/widgets/input_field.dart';

import '../controllers/create_controller.dart';

class CreateView extends GetView<CreateController> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidget.appBar(
          context, 'Add Achivement', ColorConstants.black, true),
      body: _getBody(context, controller),
    );
  }

  Widget _getBody(context, CreateController controller) {
    final sh = SizeConfig().screenHeight;
    final sw = SizeConfig().screenWidth;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.0),
                  CommonWidget.subtitleText(text: 'Achivement Name'),
                  SizedBox(height: 5.0),
                  InputField(
                    keyboardType: TextInputType.text,
                    controller: TextEditingController(),
                    placeholder: "",
                    labelText: "Achivement Name",
                  ),
                  CommonWidget.rowHeight(height: 10.0),
                  CommonWidget.subtitleText(text: 'Organizer'),
                  SizedBox(height: 5.0),
                  InputField(
                    keyboardType: TextInputType.text,
                    controller: TextEditingController(),
                    placeholder: "",
                    labelText: "Organizer",
                  ),
                  CommonWidget.rowHeight(height: 10.0),
                  CommonWidget.subtitleText(text: 'Level'),
                  SizedBox(height: 5.0),
                  InputField(
                    keyboardType: TextInputType.text,
                    controller: TextEditingController(),
                    placeholder: "",
                    labelText: "Level",
                  ),
                  CommonWidget.rowHeight(height: 10.0),
                  CommonWidget.subtitleText(text: 'Year'),
                  SizedBox(height: 5.0),
                  InputField(
                    keyboardType: TextInputType.text,
                    controller: TextEditingController(),
                    placeholder: "",
                    labelText: "Year",
                  ),
                  CommonWidget.rowHeight(height: 10.0),
                  CommonWidget.subtitleText(text: 'File'),
                  SizedBox(height: 5.0),
                  Container(
                    child: MaterialButton(
                      onPressed: () {
                        controller.onImageButtonPressed(ImageSource.camera,
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
                    child: Obx(
                        () => CustomImagePicker.previewGridImages(controller)),
                  ),
                  CommonWidget.rowHeight(height: 20.0),
                  CustomButton(
                    buttonText: 'SIMPAN',
                    width: sw,
                    onPressed: () {
                      controller.submit();
                    },
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
