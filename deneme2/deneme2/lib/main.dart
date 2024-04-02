import 'package:flutter/material.dart';
import 'package:deneme2/users/authentication/login_page.dart';
import 'package:deneme2/users/authentication/sign_page.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SigninPage(), // SigninPage ile başlayacak
    );
  }
}
