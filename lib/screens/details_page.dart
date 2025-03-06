import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget{
  final String image;
  final String name;
  final String description;

  ProductDetailsPage({
    super.key,
    required this.image,
    required this.name,
    required this.description,
  });
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text(
         "Product Details",
         style: TextStyle(color: Colors.green),
       ),
       centerTitle: true,
     ),
     body: SingleChildScrollView(
       child: Column(
         children: [
           Image.network(image),
           SizedBox(height: 10,),
           Text(name,
             style: TextStyle(fontWeight: FontWeight.w900),
           ),
           SizedBox(height: 10,),
           Text(description),

         ],
       ),
     ),
   );
  }

}