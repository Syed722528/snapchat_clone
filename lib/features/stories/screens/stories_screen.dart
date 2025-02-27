import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapchat_clone/core/constants/app_colors.dart';

class StoriesScreen extends StatelessWidget {
  const StoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            spacing: 20,
            mainAxisSize: MainAxisSize.min,
            children: [
              buildFriendsBar(),
              buildSubcriptionsBar(),
              buildDiscoverBar(),
            ],
          ),
        ),
      ),
    );
  }

  Column buildDiscoverBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Text(
          'Discover',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 50,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 10,
              children: [
                CustomButtonStoriesDiscoverTab(text: 'Art'),
                CustomButtonStoriesDiscoverTab(text: 'Style', isSelected: true),
                CustomButtonStoriesDiscoverTab(text: 'Cinema'),
                CustomButtonStoriesDiscoverTab(text: 'Vines'),
              ],
            ),
          ),
        ),
        SizedBox(
          height: Get.height * 0.66,
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 10,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.6,
            ),
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/stories2.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.2),
                      BlendMode.darken,
                    ),
                  ),
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),

                margin: EdgeInsets.all(5),
                child: Text(
                  'Headiline for the Story',
                  style: TextStyle(color: AppColors.appWhite, fontSize: 15),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Column buildSubcriptionsBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Subscriptions',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: Get.height * 0.25,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(right: 10),
                width: Get.width * 0.37,
                padding: EdgeInsets.all(20),
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(
                  color: AppColors.appBlack,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage('assets/images/stories.png'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5),
                      BlendMode.darken,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Data',
                      style: TextStyle(
                        color: AppColors.appWhite,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Data as well',
                      style: TextStyle(color: AppColors.appWhite, fontSize: 14),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Column buildFriendsBar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Friends',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: Get.height * 0.20,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,

            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(right: 10, top: 10),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle, // Makes it circular
                        border: Border.all(
                          color: Colors.purple, // Border color
                          width: 2.0, // Border thickness
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: AppColors.appWhite,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Image.asset(
                            'assets/images/bitmoji.png',
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                    Text('Name', style: TextStyle(color: Colors.black)),
                    Text('Person Id', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class CustomButtonStoriesDiscoverTab extends StatelessWidget {
  final bool isSelected;
  final String text;
  const CustomButtonStoriesDiscoverTab({
    super.key,
    required this.text,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromWidth(100),
        foregroundColor: AppColors.appBlack,
        backgroundColor:
            !isSelected
                ? const Color.fromARGB(255, 243, 242, 242)
                : Colors.yellow,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: Text(text),
    );
  }
}
