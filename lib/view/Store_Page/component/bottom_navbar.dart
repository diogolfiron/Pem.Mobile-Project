import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tokosepatu/view/Api_Page/api_page.dart';
import 'package:tokosepatu/view/Catalog/catalog.dart';
import 'package:tokosepatu/view/Image_Picker/image.dart';
import 'package:tokosepatu/view/Web_View/webview.dart';
import 'icon_bottom_bar.dart';

class BottomNavBarFb1 extends StatelessWidget {
  BottomNavBarFb1({Key? key}) : super(key: key);

  // final primaryColor = Color.fromARGB(255, 236, 235, 254);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Color.fromARGB(14, 22, 41, 255),
      child: SizedBox(
        height: 56,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconBottomBar(
                text: "Home",
                icon: Icons.home_filled,
                selected: false,
                onPressed: () {
                  // Get.to(Api_Page(title: 'API'));
                },
              ),
              IconBottomBar(
                  text: "Store",
                  icon: Icons.store_mall_directory,
                  selected: false,
                  onPressed: () {
                    Get.to(CatalogScreen());
                  }),
              IconBottomBar(
                  text: "Search",
                  icon: Icons.bookmark_border_outlined,
                  selected: false,
                  onPressed: () {
                    Get.to(webview());
                  }),
              IconBottomBar(
                  text: "Cart",
                  icon: Icons.shopping_bag_outlined,
                  selected: false,
                  onPressed: () {
                    Get.to(ImagePickerExample());
                  }),
              IconBottomBar(
                  text: "API",
                  icon: Icons.api,
                  selected: false,
                  onPressed: () {
                    Get.to(api_page());
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
