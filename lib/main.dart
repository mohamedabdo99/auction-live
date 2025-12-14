import 'package:auction/reaponive_framwork_widget.dart';
import 'package:auction/screen/home_screen.dart';
import 'package:auction/screen/splash.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // تهيئة التطبيق
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "مزاد إرث الدرعية",
      // locale: const Locale('ar', 'EG'),
      // supportedLocales: const [
      //   Locale('ar', 'EG'), // العربية السعودية
      //   Locale('ar'), // العربية العامة (كاحتياطي)
      // ],

      navigatorKey: navigatorKey,
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: AppResponsiveWrapper(child: child!),
        );
      },

      theme: ThemeData(
        primaryColor: Color(0xFF1B1B1F),
        fontFamily: 'newFont',
        useMaterial3: true,
      ),
      home:HomeScreen(),
    );
  }
}
