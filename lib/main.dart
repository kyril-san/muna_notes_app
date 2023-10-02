// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:muna_notes_app/const/general_colors.dart';
import 'package:muna_notes_app/firebase_options.dart';
import 'package:muna_notes_app/screens/homepage/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(414, 896),
      builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Note App',
          theme: ThemeData(
            appBarTheme: AppBarTheme(color: AppColors.blackcolor),
            colorScheme: ColorScheme.dark(
                brightness: Brightness.dark,
                background: Color.fromARGB(255, 37, 37, 37),
                primary: Colors.white),
            useMaterial3: true,
          ),
          home: HomePage()),
    );
  }
}
