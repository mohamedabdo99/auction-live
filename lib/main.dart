import 'package:auction/reaponive_framwork_widget.dart';
import 'package:auction/screen/home_screen.dart';
import 'package:flutter/material.dart';

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
      title: "مزاد إرث الدرعية",
      builder: (context, child) {
        return AppResponsiveWrapper(child: child);
      },
      theme: ThemeData(
        primaryColor: Color(0xFF1B1B1F),
        fontFamily: 'newFont',
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
