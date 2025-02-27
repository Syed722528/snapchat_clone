import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapchat_clone/features/chat/screens/chat_screen.dart';
import 'package:snapchat_clone/features/map/screens/map_screen.dart';
import 'package:snapchat_clone/features/stories/screens/stories_screen.dart';

import '../features/camera/screens/camera_screen.dart';

class NavigationController extends GetxController {
  RxInt index = 1.obs;

  void updateIndex(int currentIndex) {
    index.value = currentIndex;
    update();
  }

  List<Widget?> body = [
    MapScreen(),
    ChatScreen(),
    CameraScreen(),
    StoriesScreen(),
    null,
  ];
}
