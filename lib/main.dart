import 'package:flutter/material.dart';
import 'utils/routes.dart';
import 'views/registration_page.dart';
import 'views/splash.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: '/',
      getPages: GetRoutes.routes,
    );
  }
}
