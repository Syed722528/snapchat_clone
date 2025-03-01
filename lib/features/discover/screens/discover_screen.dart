import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../controlles/video_controller.dart';

// Video Screen UI
class VideoScreen extends StatelessWidget {
  final VideoController controller = Get.put(VideoController());
  VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          controller.togglePlayPause();
        },
        child: GetBuilder<VideoController>(
          builder: (controller) {
            return PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: controller.videoUrls.length,
              onPageChanged: controller.onPageChanged,
              itemBuilder: (context, index) {
                return Obx(() {
                  if (index == controller.currentIndex.value &&
                      controller.currentController.value != null &&
                      controller.currentController.value!.value.isInitialized) {
                    return Stack(
                      fit: StackFit.expand,

                      children: [
                        SizedBox.expand(
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: SizedBox(
                              width:
                                  controller
                                      .currentController
                                      .value!
                                      .value
                                      .size
                                      .width,
                              height:
                                  controller
                                      .currentController
                                      .value!
                                      .value
                                      .size
                                      .height,
                              child: VideoPlayer(
                                controller.currentController.value!,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: Column(
                            spacing: 10,

                            children: [
                              Obx(() {
                                return IconButton(
                                  onPressed: () {
                                    controller.toggleIsliked();
                                  },
                                  style: customIconStyle(),
                                  icon:
                                      !controller.isLiked.value
                                          ? Icon(Icons.favorite)
                                          : Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          ),
                                );
                              }),

                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.chat),
                                style: customIconStyle(),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.send),
                                style: customIconStyle(),
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.more_horiz),
                                style: customIconStyle(),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          left: 10,
                          bottom: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '▶  256k',
                                style: TextStyle(color: Colors.white),
                              ),
                              Row(
                                spacing: 10,
                                children: [
                                  CircleAvatar(radius: 15),
                                  Text(
                                    '@Syed Hassan',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                });
              },
            );
          },
        ),
      ),
    );
  }
}

customIconStyle() {
  return ButtonStyle(
    backgroundColor: WidgetStatePropertyAll(
      const Color.fromARGB(255, 231, 231, 231),
    ),
    foregroundColor: WidgetStatePropertyAll(Colors.white),
  );
}
