// Sidan du kommer till när du valt kategori
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:template/data.dart';

class CategoryPage extends StatelessWidget {
  final Categories categories;
  const CategoryPage(this.categories);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: Colors.white,
        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarBrightness: Brightness.light),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Text(
                    categories.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  child: Text(
                    categories.description,
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Container(
                      height: 500,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(255, 212, 137, 203),
                                Color.fromARGB(255, 233, 168, 170)
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                      child: Center(
                        child: Text(categories.description,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 65,
                                color: Color.fromARGB(255, 255, 255, 255))),
                      )),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'VIEW NEXT',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
