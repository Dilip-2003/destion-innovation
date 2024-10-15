import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_app/views/carousel.dart';
import 'package:grocery_app/views/registration.dart';
import 'views/login_page.dart';
import 'views/product_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Grocery App',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0XFF275f60),
        ),
        // primaryColor: const Color(0XFFFFFFFF),
        scaffoldBackgroundColor: const Color(0XFFFFFFFF),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const CarouselViewScreen()),
        GetPage(name: '/register', page: () => RegistrationPage()),
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/products', page: () => ProductPage()),
      ],
    );
  }
}
