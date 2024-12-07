import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prochain_dimata/routes/app_routes.dart';
import 'routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prochain Dimata',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      initialRoute: AppRoutes.CATEGORY,
      getPages: AppPages.pages,
    );
  }
}
