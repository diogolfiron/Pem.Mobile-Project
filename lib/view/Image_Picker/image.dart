import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ImagePickerExample extends StatefulWidget {
  @override
  _ImagePickerExampleState createState() => _ImagePickerExampleState();
}

class _ImagePickerExampleState extends State<ImagePickerExample> {
  File? _imageFile;

  Future<void> _pickImage(ImageSource source) async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: source);

    if (pickedImage != null) {
      final imageFile = File(pickedImage.path);

      final appDocDir = await getExternalStorageDirectory();
      final imageDirectory = Directory('${appDocDir!.path}/gambar');
      await imageDirectory.create(recursive: true);

      final uniqueFileName =
          '${imageDirectory.path}/${DateTime.now().millisecondsSinceEpoch}.png';

      await imageFile.copy(uniqueFileName);

      setState(() {
        _imageFile = imageFile;
      });
    }
  }

  Future<void> _saveImage() async {
    if (_imageFile != null) {
      final appDocDir = await getExternalStorageDirectory();
      final targetDirectory = Directory('${appDocDir!.path}sepatuv2/gambar');
      await targetDirectory.create(recursive: true);
      final uniqueFileName =
          '${targetDirectory.path}/${DateTime.now().millisecondsSinceEpoch}.png';

      // Memeriksa apakah _imageFile tidak null sebelum menggunakan copy
      if (_imageFile != null) {
        await _imageFile!.copy(uniqueFileName);
      }

      // Implementasi logika penyimpanan sesuai dengan kebutuhan aplikasi Anda setelah menyimpan gambar.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image picker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_imageFile != null)
              Image.file(_imageFile!)
            else
              Text('No image selected'),
            ElevatedButton(
              onPressed: () => _pickImage(ImageSource.gallery),
              child: Text('Pick an image from gallery'),
            ),
            ElevatedButton(
              onPressed: () => _pickImage(ImageSource.camera),
              child: Text('Capture an image from camera'),
            ),
            ElevatedButton(
              onPressed: () => _saveImage(),
              child: Text('Save Image'),
            ),
          ],
        ),
      ),
    );
  }
}
