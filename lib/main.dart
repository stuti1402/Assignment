import 'package:flutter/material.dart';
import 'package:untitled1/screens/landing_page.dart';
import 'package:untitled1/ui_views/onboardinglayoutview.dart';

import 'Pages/ItemAddPage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        primaryColor: Colors.white,


      ),
      home:  LandingPage(),
    );
  }
}
