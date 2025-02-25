// lib/features/camera/screens/camera_screen.dart
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/camera_controller.dart';

class CameraScreen extends StatelessWidget {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize and get the controller
    final CustomCameraController cameraController = Get.put(
      CustomCameraController(),
    );

    return Scaffold(
      body: Obx(
        () =>
            cameraController.controller.value == null ||
                    !cameraController.controller.value!.value.isInitialized
                ? const Center(child: CircularProgressIndicator())
                : Stack(
                  fit: StackFit.expand,
                  children: [
                    RotatedBox(
                      quarterTurns:
                          cameraController
                              .controller
                              .value!
                              .description
                              .sensorOrientation ~/
                          90,
                      child: CameraPreview(cameraController.controller.value!),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 20,
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.cameraswitch,
                              color: Colors.white,
                            ),
                            onPressed: cameraController.switchCamera,
                          ),
                          IconButton(
                            icon: Icon(
                              cameraController.flashMode.value == FlashMode.off
                                  ? Icons.flash_off
                                  : Icons.flash_on,
                              color: Colors.white,
                            ),
                            onPressed: cameraController.toggleFlash,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
      ),
    );
  }
}
