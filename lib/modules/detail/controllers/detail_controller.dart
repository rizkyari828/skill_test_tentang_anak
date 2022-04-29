import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tama_skill_test/api/api_repository.dart';
import 'package:tama_skill_test/models/request/delete_request.dart';
import 'package:tama_skill_test/models/request/update_request.dart';
import 'package:tama_skill_test/models/response/list_achivement_response.dart';

class DetailController extends GetxController {
  final ApiRepository apiRepository;

  final argm = Get.arguments;
  Achivement achivement = new Achivement();

  final achivementNameController = TextEditingController();
  final organizerController = TextEditingController();
  final levelController = TextEditingController();
  final yearController = TextEditingController();
  final fileController = TextEditingController();

  var imageFileList = <XFile>[].obs;

  set _imageFile(XFile? value) {
    imageFileList.addAll((value == null ? null : <XFile>[value])!);
  }

  dynamic pickImageError;
  RxString? retrieveDataError;

  final ImagePicker _picker = ImagePicker();
  final TextEditingController maxWidthController = TextEditingController();
  final TextEditingController maxHeightController = TextEditingController();
  final TextEditingController qualityController = TextEditingController();

  DetailController({required this.apiRepository}) {
    achivement = argm;
    achivementNameController.text = achivement.achievementName ?? '';
    organizerController.text = achivement.organizer ?? '';
    levelController.text = achivement.level ?? '';
    yearController.text = achivement.year ?? '';
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void destroy() async {
    final res = await apiRepository.destroyData(
      DeleteRequest(
        id: achivement.id ?? 0,
      ),
    );
    if (res!.success == true) {
      EasyLoading.showSuccess('Delete Success');
      Get.back();
    } else {
      EasyLoading.showError('Delete Failed');
    }
  }

  void editData() async {
    final res = await apiRepository.updateData(
      UpdateRequest(
        id: achivement.id ?? 0,
        achievementName: achivementNameController.text,
        organizer: organizerController.text,
        level: levelController.text,
        year: yearController.text,
        file: fileController.text,
      ),
    );
    if (res!.success == true) {
      EasyLoading.showSuccess('Saved Success');
      Get.back();
    } else {
      EasyLoading.showError('Saved Failed');
    }
  }

  Future<void> onImageButtonPressed(ImageSource source,
      {BuildContext? context, bool isMultiImage = false}) async {
    if (isMultiImage) {
      await _displayPickImageDialog(context!,
          (double? maxWidth, double? maxHeight, int? quality) async {
        try {
          final List<XFile>? pickedFileList = await _picker.pickMultiImage(
            maxWidth: maxWidth,
            maxHeight: maxHeight,
            imageQuality: quality,
          );

          imageFileList.addAll(pickedFileList!);
        } catch (e) {
          pickImageError = e;
        }
      });
    } else {
      await _displayPickImageDialog(context!,
          (double? maxWidth, double? maxHeight, int? quality) async {
        try {
          final XFile? pickedFile = await _picker.pickImage(
            source: source,
            maxWidth: maxWidth,
            maxHeight: maxHeight,
            imageQuality: quality,
          );

          _imageFile = pickedFile;
        } catch (e) {
          pickImageError = e;
        }
      });
    }
  }

  Future<void> _displayPickImageDialog(BuildContext context, onPick) async {
    return onPick(200.0, 200.0, 50);
  }

  @override
  void onClose() {}
}
