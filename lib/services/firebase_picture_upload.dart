import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebasePictureUpload {
  String status = '';
  FirebaseStorage storage = FirebaseStorage.instance;
  DateTime dateTime = DateTime.now();

  Future<String> uploadPicture(File image) async {
    Reference ref =
        storage.ref().child('user').child(dateTime.toIso8601String());
    TaskSnapshot uploadImage = await ref.putFile(image);

    if (uploadImage.state == TaskState.success) {
      status = 'uploaded succefully';
    } else {
      status = 'failed';
    }
    return status;
  }
}
