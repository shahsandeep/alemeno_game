import 'dart:io';

import 'package:alemeno_game_internship/services/firebase_picture_upload.dart';
import 'package:alemeno_game_internship/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../constants/route.dart';

class PictureViewModel extends ChangeNotifier {
  File? _image;

  File? get image => _image;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  setIsLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  setPicture(
    File image,
  ) {
    _image = image;

    notifyListeners();
  }

  Future clickPicture(
    BuildContext context,
  ) async {
    setIsLoading(true);
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
    );

    if (pickedFile != null) {
      setPicture(
        File(pickedFile.path),
      );
      setIsLoading(false);
      if (context.mounted) {
        Navigator.of(context).pushNamed(landSharePictureRoute);
      }
    } else {
      if (context.mounted) {
        showSnackBar(
          context,
          'No Image Selected!',
        );
      }
      setIsLoading(false);
    }
    notifyListeners();
  }

  uploadPicture(BuildContext context) async {
    setIsLoading(true);
    final firebaseStorage = FirebasePictureUpload();
    final response = await firebaseStorage.uploadPicture(_image!);
    if (response == 'uploaded succefully') {
      if (context.mounted) {
        showSnackBar(context, 'Thank you for sharing food with me');
        Navigator.of(context).pushNamedAndRemoveUntil(
          message,
          ((route) {
            return route.isFirst || route.settings.name == homeRoute;
          }),
        );
      }
    }
    setIsLoading(false);
  }
}
