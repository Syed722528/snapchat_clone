import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/camera_controller.dart';
import '../controllers/camera_screen_controller.dart';

class CameraScreen extends StatelessWidget {
  final uiController = Get.put(CameraScreenController());
  final cameraController = Get.put(CameraControllerX());

  CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CameraControllerX>(
      builder: (controller) {
        return controller.cameraController == null ||
                !controller.cameraController!.value.isInitialized
            ? Center(child: CircularProgressIndicator())
            : Stack(
              fit: StackFit.expand,
              children: [
                RotatedBox(
                  quarterTurns:
                      controller
                          .cameraController!
                          .description
                          .sensorOrientation ~/
                      90,
                  child: CameraPreview(controller.cameraController!),
                ),
                buildTopBar(controller),
                buildBottomToolBar(),
              ],
            );
      },
    );
  }

  Positioned buildBottomToolBar() {
    return Positioned(
      bottom: 80,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.file_copy_outlined, size: 35),

          Icon(Icons.circle_outlined, size: 120),

          Icon(Icons.emoji_emotions, size: 35),
        ],
      ),
    );
  }

  Positioned buildTopBar(CameraControllerX controller) {
    return Positioned(
      top: 30,
      right: 0,
      left: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.cameraswitch),
                onPressed: controller.switchCamera,
              ),
              IconButton(icon: Icon(Icons.search), onPressed: () {}),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(icon: Icon(Icons.person_add), onPressed: () {}),
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.switch_camera),
                    onPressed: controller.switchCamera,
                  ),
                  IconButton(
                    icon: Obx(
                      () => Icon(
                        controller.flashMode.value == FlashMode.off
                            ? Icons.flash_off
                            : Icons.flash_on,
                      ),
                    ),
                    onPressed: controller.toggleFlash,
                  ),

                  IconButton(onPressed: () {}, icon: Icon(Icons.music_note)),
                  Obx(() {
                    return !uiController.isTopBarOpen.value
                        ? IconButton(
                          onPressed: uiController.updateIsTopBarOpen,
                          icon: Icon(Icons.keyboard_arrow_down_sharp),
                        )
                        : Column(
                          children: [
                            IconButton(onPressed: () {}, icon: Icon(Icons.abc)),
                            IconButton(onPressed: () {}, icon: Icon(Icons.abc)),
                            IconButton(onPressed: () {}, icon: Icon(Icons.abc)),
                            IconButton(onPressed: () {}, icon: Icon(Icons.abc)),
                            IconButton(
                              onPressed: uiController.updateIsTopBarOpen,
                              icon: Icon(Icons.keyboard_arrow_up),
                            ),
                          ],
                        );
                  }),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }


}
