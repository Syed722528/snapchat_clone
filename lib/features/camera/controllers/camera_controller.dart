// lib/features/camera/controllers/camera_controller.dart
import 'package:camera/camera.dart';
import 'package:get/get.dart';

class CustomCameraController extends GetxController {
  Rx<CameraController?> controller = Rx<CameraController?>(null);
  RxList<CameraDescription> cameras = <CameraDescription>[].obs;
  RxInt selectedCameraIndex = 0.obs;
  Rx<FlashMode> flashMode = FlashMode.off.obs;

  @override
  void onInit() {
    super.onInit();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    cameras.value = await availableCameras();
    if (cameras.isNotEmpty) {
      controller.value = CameraController(
        cameras[selectedCameraIndex.value],
        ResolutionPreset.max,
        imageFormatGroup: ImageFormatGroup.bgra8888,
      );
      await controller.value!.initialize();
      update(); // Notify GetX to rebuild UI
    }
  }

  void switchCamera() {
    if (cameras.length > 1) {
      selectedCameraIndex.value = (selectedCameraIndex.value + 1) % cameras.length;
      _initializeCamera();
    }
  }

  void toggleFlash() {
    if (controller.value != null && controller.value!.value.isInitialized) {
      flashMode.value = flashMode.value == FlashMode.off ? FlashMode.torch : FlashMode.off;
      controller.value!.setFlashMode(flashMode.value);
      update();
    }
  }

  @override
  void onClose() {
    controller.value?.dispose();
    super.onClose();
  }
}