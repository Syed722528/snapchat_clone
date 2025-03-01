import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapchat_clone/features/chat/screens/chat_screen.dart';
import 'package:snapchat_clone/features/discover/screens/discover_screen.dart';
import 'package:snapchat_clone/features/map/screens/map_screen.dart';
import 'package:snapchat_clone/features/stories/screens/stories_screen.dart';

import '../core/common_widgets/app_bar.dart';
import '../core/constants/app_colors.dart';
import '../features/camera/screens/camera_screen.dart';

class NavigationController extends GetxController {
  RxInt index = 3.obs;

  void updateIndex(int currentIndex) {
    index.value = currentIndex;
    update();
  }

  List<PreferredSizeWidget?> appBars = [
    null,

    buildAppBar(
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.mark_chat_read_outlined),
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(AppColors.appGrey),
        ),
      ),
      'Chat',
      AppColors.appBlack,
    ),
    null,
    buildAppBar(
      IconButton(
        onPressed: () {},
        icon: Icon(Icons.more_horiz_rounded),
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(AppColors.appGrey),
        ),
      ),
      'Stories ',
      Colors.black,
    ),
    null,
  ];
  List<Widget?> body = [
    MapScreen(),
    ChatScreen(),
    CameraScreen(),
    StoriesScreen(),
    VideoScreen(),
  ];
}
