import 'package:emart_app/consts/consts.dart';
import 'package:flutter/material.dart';

class CategorieScreen extends StatelessWidget {
  const CategorieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.green, // Yellow
              height: 120.0,
            ),
            Image.network(
                'https://flutter-examples.com/wp-content/uploads/2019/09/blossom.jpg',
                width: 300,
                height: 200,
                fit: BoxFit.contain),
            Image.network(
                'https://flutter-examples.com/wp-content/uploads/2019/09/sample_img.png',
                width: 200,
                fit: BoxFit.contain),
            Container(
              color: Colors.pink, // Yellow
              height: 120.0,
            ),
            const Text('Some Sample Text - 1', style: TextStyle(fontSize: 28)),
            const Text('Some Sample Text - 2', style: TextStyle(fontSize: 28)),
            const Text('Some Sample Text - 3', style: TextStyle(fontSize: 28)),
            Container(
              color: Colors.redAccent, // Yellow
              height: 120.0,
            ),
            Image.network(
                'https://flutter-examples.com/wp-content/uploads/2019/09/blossom.jpg',
                width: 300,
                height: 200,
                fit: BoxFit.contain),
          ],
        ),
      ),
    ));
  }
}
