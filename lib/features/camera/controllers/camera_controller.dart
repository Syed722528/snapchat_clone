import 'package:camera/camera.dart';
import 'package:get/get.dart';

class CameraControllerX extends GetxController {
  CameraController? cameraController;
  List<CameraDescription>? cameras;
  var selectedCameraIndex = 0.obs;
  var flashMode = FlashMode.off.obs;

  @override
  void onInit() {
    super.onInit();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    cameras = await availableCameras();
    if (cameras!.isNotEmpty) {
      cameraController = CameraController(
        cameras![selectedCameraIndex.value],
        ResolutionPreset.max,
      );
      await cameraController!.initialize();
      update();
    }
  }

  void switchCamera() async {
    if (cameras!.length > 1) {
      selectedCameraIndex.value =
          (selectedCameraIndex.value + 1) % cameras!.length;
      await initializeCamera();
    }
  }

  void toggleFlash() async {
    flashMode.value =
        flashMode.value == FlashMode.off ? FlashMode.torch : FlashMode.off;
    await cameraController!.setFlashMode(flashMode.value);
  }

  @override
  void onClose() {
    cameraController?.dispose();
    super.onClose();
  }
}
