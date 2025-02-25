import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapchat_clone/features/camera/screens/camera_screen.dart';
import 'package:snapchat_clone/navigation/navigation_controller.dart';

class AppNavigation extends StatelessWidget {
  const AppNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    List<Color> selectedIconColors = [
      Colors.green,
      Colors.blue,
      Colors.yellow,
      Colors.purpleAccent,
      Colors.red,
    ];
    final navigationController = Get.put(NavigationController());
    List<Widget> body = [CameraScreen()];
    return Scaffold(
      body: body[0],
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: false,
          selectedItemColor:
              selectedIconColors[navigationController.index.value],
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
            BottomNavigationBarItem(icon: Icon(Icons.people), label: '🢑'),
            BottomNavigationBarItem(
              icon: Icon(Icons.play_arrow_outlined),
              label: '▲',
            ),
          ],
        );
      }),
    );
  }
}
