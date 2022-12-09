import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_app/pages/home_page.dart';
import 'package:getx_todo_app/pages/note_page.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, Orientation, ScreenType) {
      return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:  NotePage()
    );
    },);
  }
}