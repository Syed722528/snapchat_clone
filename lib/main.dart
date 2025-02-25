import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/camera/screens/camera_screen.dart';

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
      home: CameraScreen(),
    );
  }
}
