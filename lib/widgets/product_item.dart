import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String image;
  final String name;
  final dynamic price;

  ProductItem({
    super.key,
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 300,
      child: Card(
        elevation: 10,
        child: Column(
          children: [
            Container(
              height: 100,
              child: Image.network(
                image,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              name,
              maxLines: 1,
               style: TextStyle(fontWeight: FontWeight.w900),
            ),
            const SizedBox(height: 5),
            Text(
              "$price LE",

            ),
          ],
        ),
      ),
    );
  }
}
