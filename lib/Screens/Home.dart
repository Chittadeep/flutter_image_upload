import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            selectedImage != null
                ? SizedBox(height: 300, width: 200,
                    child: Image.file(selectedImage!),
                )
                : Text("Select an image"),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () => pickImageFromGallery(),
                    child: Text("Upload from gallery")),
                ElevatedButton(
                    onPressed: () => pickImageFromCamera(),
                    child: Text("upload from camera"))
              ],
            )
          ],
        ),
      ),
    );
  }

  Future pickImageFromGallery() async {
    print("Pick image from gallery called");
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (returnedImage != null) {
      setState(() {
        selectedImage = File(returnedImage.path);
      });
    }
  }

  Future pickImageFromCamera() async {
    print("Pick image from gallery called");
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);

    if (returnedImage != null) {
      setState(() {
        selectedImage = File(returnedImage.path);
      });
    }
  }
}
