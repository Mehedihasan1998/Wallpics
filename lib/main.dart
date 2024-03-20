import 'package:flutter/material.dart';
import 'package:wallpics/screens/home/home_view.dart';
import 'package:wallpics/dependencies/dependencies.dart' as di;

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: Color(0xffFFEA00),
            onPrimary: Color(0xff000918),
            secondary: Color(0xffF3F3F3),
            onSecondary: Color(0xff000918),
            error: Colors.red,
            onError: Colors.white,
            background: Color(0xff000918),
            onBackground: Colors.white,
            surface: Color(0xffFFEA00),
            onSurface: Colors.white,
        ),
        scaffoldBackgroundColor: const Color(0xff000918),

      ),
      home: HomeView(),
    );
  }
}
