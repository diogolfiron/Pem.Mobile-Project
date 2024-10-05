import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tokosepatu/controller/catalog_controller.dart';

class CatalogScreen extends StatefulWidget {
  final CatalogController catalogController = Get.put(CatalogController());

  @override
  _CatalogScreenState createState() => _CatalogScreenState();
}

class CatalogItem {
  final String name;
  final String description;
  final double price;
  final String imagePath;

  CatalogItem({
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
  });
}

class _CatalogScreenState extends State<CatalogScreen> {
  double? screenWidth;
  List<String> menuItems = [
    "All",
    "Gym",
    "Running",
    "School",
    "Sneakers",
    "Flat Shoes",
    "High Shoes",
    "Sandal",
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    screenWidth ??= MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromARGB(14, 22, 41, 255),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          MyTheme.largeVerticalPadding,
          const SizedBox(height: 10.0),
          Container(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  ],
                ),
                SizedBox(width: 16.0),
                Row(
                  children: [
                    Text(
                      'Footwear',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 16.0),
                Row(
                  children: [
                    Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 40.0),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 330,
                    height: 50,
                    child: Card(
                      color: Color.fromARGB(255, 33, 34, 49),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search',
                          hintStyle:
                              TextStyle(fontSize: 21, color: Colors.white),
                          prefixIcon: Icon(
                            Icons.search_sharp,
                            // size: 30,
                          ),
                          prefixIconColor: Color.fromARGB(255, 255, 255, 255),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      //Get.to(Web_View());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 33, 34, 49),
                        border: Border.all(
                          color: Color.fromARGB(255, 33, 34, 49),
                          width: 8.5,
                        ),
                      ),
                      child: const Icon(
                        Icons.tune,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          Container(
            height: 50.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      color: index == selectedIndex
                          ? Colors.blue
                          : Color.fromARGB(255, 33, 34, 49),
                      borderRadius: BorderRadius.circular(10.0),
                      // border: Border.all(
                      //   width: 30,
                      // ),
                    ),
                    child: Text(
                      menuItems[index],
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          GridView.count(
            childAspectRatio: 0.75,
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              etalasCard(
                etalasImage: const AssetImage('gambar/sepatu1.png'),
                etalasName: "Sneaker Nike Orange",
                etalasPrice: "\$4.89",
              ),
              etalasCard(
                etalasImage: const AssetImage('gambar/sepatu2.png'),
                etalasName: "High Heels Red",
                etalasPrice: "\$129",
              ),
              etalasCard(
                etalasImage: const AssetImage('gambar/sepatu3.png'),
                etalasName: "Vans Black on White",
                etalasPrice: "\$180",
              ),
              etalasCard(
                etalasImage: const AssetImage('gambar/sepatu4.png'),
                etalasName: "Shoes White",
                etalasPrice: "\$140",
              ),
              etalasCard(
                etalasImage: const AssetImage('gambar/sepatu5.png'),
                etalasName: "Nike Snow White",
                etalasPrice: "\$190",
              ),
              etalasCard(
                etalasImage: const AssetImage('gambar/sepatu6.png'),
                etalasName: "Running Shoes Blue",
                etalasPrice: "\$986",
              ),
              etalasCard(
                etalasImage: const AssetImage('gambar/sepatu7.png'),
                etalasName: "Woods High Heels",
                etalasPrice: "\$90",
              ),
              etalasCard(
                etalasImage: const AssetImage('gambar/sepatu8.png'),
                etalasName: "High Shoes Brown",
                etalasPrice: "\$187",
              ),
              etalasCard(
                etalasImage: const AssetImage('gambar/sepatu9.png'),
                etalasName: "Yellow Sneaker",
                etalasPrice: "\$360",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget etalasCard({
    required AssetImage etalasImage,
    required String etalasName,
    required String etalasPrice,
  }) {
    return GestureDetector(
      onTap: () {
        String etalasDescription = '';
        if (etalasName == "Sneaker Greenly") {
          etalasDescription = "Deskripsi Best For Schools";
        } else if (etalasName == "High Heels Red") {
          etalasDescription = "Deskripsi Beauty High Heels 20cm";
        } else if (etalasName == "Vans Black on White") {
          etalasDescription = "Deskripsi Best For Your Style";
        } else if (etalasName == "Shoes White") {
          etalasDescription = "Deskripsi Full White and Cool";
        } else if (etalasName == "Nike Snow White") {
          etalasDescription = "Perfect For Your Style";
        } else if (etalasName == "Running Shoes Blue") {
          etalasDescription = "Best for Acuration Speed";
        } else if (etalasName == "Woods High Heels") {
          etalasDescription = "Women for Party";
        } else if (etalasName == "High Shoes Brown") {
          etalasDescription = "Perfect Fit for Explore";
        } else if (etalasName == "Yellow Sneaker") {
          etalasDescription = "For School perfect your style";
        }

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
                productName: etalasName,
                productPrice: etalasPrice,
                productDescription: etalasDescription,
                productImage: etalasImage,
                productSizes: []),
          ),
        );
      },
      child: Card(
        color: MyTheme.etalasCardColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: screenWidth! < 400 ? 3 : 5,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(8.0),
                  child: Image(
                    image: etalasImage,
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(etalasName,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    MyTheme.smallVerticalPadding,
                    Text(
                      etalasPrice,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final String productName;
  final String productPrice;
  final String productDescription;
  final AssetImage productImage;
  final List<String> productSizes;

  ProductDetailScreen({
    required this.productName,
    required this.productPrice,
    required this.productDescription,
    required this.productImage,
    required this.productSizes,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(14, 22, 41, 255),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: Text(
                      productName,
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image(
                        image: productImage,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        List<String> productSizes = [
                          "31",
                          "32",
                          "33",
                          "34",
                          "35"
                        ];
                        return Container(
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              productSizes[index],
                              style:
                                  TextStyle(fontSize: 15, color: Colors.white),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    productDescription,
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text(
                        productPrice,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          // Tindakan yang ingin Anda lakukan saat tombol ditekan
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor: Color.fromARGB(255, 33, 34, 49),
                        ),
                        child: Center(
                          child: Text(
                            'Add To Cart',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 40,
              right: 20,
              child: IconButton(
                icon: Icon(Icons.shopping_bag_outlined, color: Colors.white),
                onPressed: () {
                  //Action
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyTheme {
  static Color get backgroundColor => const Color(0xFFF7F7F7);
  static Color get grey => const Color(0xFF999999);
  static Color get catalogueCardColor =>
      const Color(0xFFBAE5D4).withOpacity(0.5);
  static Color get catalogueButtonColor => const Color(0xFF29335C);
  static Color get etalasCardColor => const Color.fromARGB(255, 33, 34, 49);
  static Color get progressColor => const Color(0xFF36F1CD);

  static Padding get largeVerticalPadding =>
      const Padding(padding: EdgeInsets.only(top: 32.0));

  static Padding get mediumVerticalPadding =>
      const Padding(padding: EdgeInsets.only(top: 16.0));

  static Padding get smallVerticalPadding =>
      const Padding(padding: EdgeInsets.only(top: 8.0));

  static ThemeData get theme => ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.green,
      ).copyWith(
        cardTheme: const CardTheme(
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16.0)))),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0.0),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            backgroundColor:
                MaterialStateProperty.all<Color>(catalogueButtonColor),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
        ),
      );
}

class FloatingActionButtonFb3 extends StatelessWidget {
  final Function() onPressed;
  final Widget icon;
  final Color color;
  const FloatingActionButtonFb3(
      {required this.onPressed,
      required this.icon,
      this.color = Colors.blue,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: color,
      onPressed: onPressed,
      child: icon,
    );
  }
}
