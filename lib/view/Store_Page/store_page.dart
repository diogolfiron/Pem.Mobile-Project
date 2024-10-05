import 'package:flutter/material.dart';
import 'component/bottom_navbar.dart';

class store_page extends StatelessWidget {
  final List<String> imagePaths = [
    'gambar/gambar1.jpg',
    'gambar/gambar2.jpg',
    'gambar/gambar3.jpg',
    'gambar/gambar4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(14, 22, 41, 255),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 80.0),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                'Hello!',
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text(
                'Discover The latest styles',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 90.0),
            Container(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        'Stories',
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
                        Icons.tune,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50.0),
            Container(
              height: 400,
              child: PageView.builder(
                itemCount: imagePaths.length,
                itemBuilder: (BuildContext context, int index) {
                  return Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(29.0),
                          child: Image.asset(
                            imagePaths[index],
                            width: 300,
                            height: 500,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 20.0),
            const Center(
              child: Text(
                'Meet Someone Manuel',
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: "italic",
                    color: Color.fromRGBO(255, 255, 255, 1)),
              ),
            ),
            const SizedBox(height: 7.0),
            const Center(
              child: Text(
                '#WePlayReal',
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: "italic",
                    color: Color.fromRGBO(255, 255, 255, 1)),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBarFb1(),
    );
  }
}
