import 'package:get/get.dart';

class CameraScreenController extends GetxController {
  RxBool isTopBarOpen = false.obs;

  void updateIsTopBarOpen() {
    isTopBarOpen.value = !isTopBarOpen.value;
    update();
  }
}
