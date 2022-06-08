import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageSourceChooser extends StatelessWidget {
  const ImageSourceChooser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 0.0,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        ElevatedButton(
            onPressed: () {
              final image = _takePicture(source: ImageSource.gallery);
              Navigator.pop(context, image);
            },
            child: const Text(
              "Add From Gallery",
              style: TextStyle(fontSize: 12),
            )),
        ElevatedButton(
            onPressed: () {
              final image = _takePicture(source: ImageSource.camera);
              Navigator.pop(context, image);
            },
            child: const Text("Take a picture"))
      ]),
    );
  }

  Future<Uint8List?> _takePicture({required ImageSource source}) async {
    final picker = ImagePicker();
    final photo = await picker.pickImage(source: source);
    if (photo != null) {
      var imageFile = File(photo.path);
      var imageRaw = await imageFile.readAsBytes();
      return imageRaw;
    }
    return null;
  }
}
