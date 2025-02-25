import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapchat_clone/core/constants/app_colors.dart';
import 'package:snapchat_clone/navigation/app_navigation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        iconTheme: IconThemeData(color: AppColors.appWhite),
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            foregroundColor: WidgetStatePropertyAll(AppColors.appWhite),
            backgroundColor: WidgetStateProperty.all(
              AppColors.appWhite.withOpacity(0.2),
            ), // Grey transparent
            overlayColor: WidgetStateProperty.all(
              AppColors.appWhite.withOpacity(0.1),
            ), // Hover effect
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ), // Circular shape
            ),
          ),
        ),
      ),
      home: AppNavigation(),
    );
  }
}
