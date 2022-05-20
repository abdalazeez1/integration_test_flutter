import 'dart:async' show Future;
import 'dart:io' show Platform, File;

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

Future<File?> pickImage() async {
  final pickedImage =
      await ImagePicker().pickImage(source: ImageSource.gallery);
  final imageFile = pickedImage != null ? File(pickedImage.path) : null;
  if (imageFile != null) {
    return await _cropImage(imageFile);
  }
  return null;
}

Future<File?> _cropImage(File imageFile) async {
  File? croppedFile = (await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      aspectRatioPresets: Platform.isAndroid
          ? [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9
            ]
          : [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio5x3,
              CropAspectRatioPreset.ratio5x4,
              CropAspectRatioPreset.ratio7x5,
              CropAspectRatioPreset.ratio16x9
            ],
      androidUiSettings: const AndroidUiSettings(
          toolbarTitle: 'login',
          toolbarColor: Colors.purple,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),
      iosUiSettings: const IOSUiSettings(
        title: 'login',
      )));
  if (croppedFile != null) {
    return croppedFile;
  }
  return null;
}
