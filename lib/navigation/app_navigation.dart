import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapchat_clone/core/common_widgets/app_bar.dart';
import 'package:snapchat_clone/core/constants/app_colors.dart';
import 'package:snapchat_clone/navigation/navigation_controller.dart';

class AppNavigation extends StatelessWidget {
  const AppNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationController = Get.put(NavigationController());
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
    return Obx(() {
      return Scaffold(
        backgroundColor: AppColors.appWhite,
        appBar: appBars[navigationController.index.value],
        body: navigationController.body[navigationController.index.value],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: false,
          selectedItemColor:
              AppColors.selectedNavigationBarItemColor[navigationController
                  .index
                  .value],
          currentIndex: navigationController.index.value,
          onTap: (value) => navigationController.updateIndex(value),
          iconSize: 27,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on_outlined),
              label: '▲',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline_rounded),
              label: '▲',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt_sharp),
              label: '▲',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: '▲'),
            BottomNavigationBarItem(
              icon: Icon(Icons.play_arrow_outlined),
              label: '▲',
            ),
          ],
        ),
      );
    });
  }
}
