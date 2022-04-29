import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomImagePicker {
  static Widget previewGridImages(controller) {
    final Text? retrieveError = _getRetrieveErrorWidget(controller);
    if (retrieveError != null) {
      return retrieveError;
    }
    if (controller.imageFileList != null) {
      return Semantics(
          child: GridView.count(
              key: UniqueKey(),
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              shrinkWrap: true,
              children: List.generate(
                controller.imageFileList.length,
                (index) {
                  return Semantics(
                    label: 'image_picker_example_picked_image',
                    child: kIsWeb
                        ? Image.network(controller.imageFileList[index].path)
                        : Image.file(
                            File(controller.imageFileList[index].path)),
                  );
                },
              )),
          label: 'image_picker_example_picked_images');
    } else if (controller.pickImageError != null) {
      return Text(
        'Pick image error: ${controller.pickImageError}',
        textAlign: TextAlign.center,
      );
    } else {
      return const Text(
        'You have not yet picked an image.',
        textAlign: TextAlign.center,
      );
    }
  }

    static Text? _getRetrieveErrorWidget(controller) {
    if (controller.retrieveDataError != null) {
      final Text result = Text(controller.retrieveDataError?.value ?? "");
      controller.retrieveDataError = null;
      return result;
    }
    return null;
  }
}
