import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_api/providers/product_provider.dart';
import 'package:shop_app_api/providers/registeration_provider.dart';
import 'package:shop_app_api/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RegisterProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );
  }
}
