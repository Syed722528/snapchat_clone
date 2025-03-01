import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController {
  RxBool isLiked = false.obs;

  void toggleIsliked() {
    isLiked.value != isLiked.value;
    update();
  }

  final RxList<String> videoUrls =
      [
        'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4',
        'https://cdn.pixabay.com/video/2025/01/19/253423_large.mp4',
        'https://cdn.pixabay.com/video/2022/12/18/143419-782363231_large.mp4',
        'https://cdn.pixabay.com/video/2023/10/15/185092-874643408_large.mp4',
      ].obs;

  RxInt currentIndex = 0.obs;
  Rx<VideoPlayerController?> currentController = Rx<VideoPlayerController?>(
    null,
  );
  Rx<VideoPlayerController?> previousController = Rx<VideoPlayerController?>(
    null,
  );
  Rx<VideoPlayerController?> nextController = Rx<VideoPlayerController?>(null);

  @override
  void onInit() {
    super.onInit();
    _loadCurrentVideo(currentIndex.value); // Load first video
    _preloadNextVideo(currentIndex.value + 1); // Preload next
    // Previous not preloaded initially since we're at index 0
  }

  // Load the current video
  void _loadCurrentVideo(int index) {
    currentController.value?.dispose();
    currentController.value = VideoPlayerController.networkUrl(
        Uri.parse(videoUrls[index]),
      )
      ..initialize()
          .then((_) {
            currentController.value!.pause();
            update();
          })
          .catchError((error) {
            print('Error loading current video: $error');
          });
  }

  // Preload the previous video
  void _preloadPreviousVideo(int index) {
    if (index >= 0) {
      previousController.value?.dispose();
      previousController.value = VideoPlayerController.networkUrl(
          Uri.parse(videoUrls[index]),
        )
        ..initialize()
            .then((_) {
              update(); // Ready but not playing
            })
            .catchError((error) {
              print('Error preloading previous video: $error');
            });
    } else {
      previousController.value?.dispose();
      previousController.value = null;
    }
  }

  // Preload the next video
  void _preloadNextVideo(int index) {
    if (index < videoUrls.length) {
      nextController.value?.dispose();
      nextController.value = VideoPlayerController.networkUrl(
          Uri.parse(videoUrls[index]),
        )
        ..initialize()
            .then((_) {
              update(); // Ready but not playing
            })
            .catchError((error) {
              print('Error preloading next video: $error');
            });
    } else {
      nextController.value?.dispose();
      nextController.value = null;
    }
  }

  // Handle page change (swipe up or down)
  void onPageChanged(int index) {
    currentController.value?.pause(); // Pause current video

    // Swipe forward: Use preloaded nextController
    if (index == currentIndex.value + 1 && nextController.value != null) {
      currentController.value = nextController.value;
      nextController.value = null;
      currentController.value!.play();
    }
    // Swipe backward: Use preloaded previousController
    else if (index == currentIndex.value - 1 &&
        previousController.value != null) {
      currentController.value = previousController.value;
      previousController.value = null;
      currentController.value!.play();
    }
    // Fallback: Load video on-demand if not preloaded
    else {
      _loadCurrentVideo(index);
    }

    currentIndex.value = index;
    update();

    // Preload adjacent videos
    _preloadPreviousVideo(index - 1);
    _preloadNextVideo(index + 1);
  }

  void togglePlayPause() {
    if (currentController.value != null &&
        currentController.value!.value.isInitialized) {
      if (currentController.value!.value.isPlaying) {
        currentController.value!.pause();
      } else {
        currentController.value!.play();
      }
      update(); // Trigger UI update if needed (e.g., for play/pause icon)
    }
  }

  @override
  void onClose() {
    currentController.value?.dispose();
    previousController.value?.dispose();
    nextController.value?.dispose();
    super.onClose();
  }
}
