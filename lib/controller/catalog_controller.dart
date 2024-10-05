import 'package:get/get.dart';

class CatalogController extends GetxController {
  var selectedImagePath = ''.obs;

  void pickImage(String imagePath) {
    selectedImagePath.value = imagePath;
  }
}
