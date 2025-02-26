import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapchat_clone/core/constants/app_colors.dart';

class StoriesScreen extends StatelessWidget {
  const StoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Friends',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,

                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(right: 10, top: 10),
                          child: Column(
                            children: [
                              CircleAvatar(radius: 40),
                              Text(
                                'Name',
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Column(
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
                          CustomButtonStoriesDiscoverTab(
                            text: 'Style',
                            isSelected: true,
                          ),
                          CustomButtonStoriesDiscoverTab(text: 'Cinema'),
                          CustomButtonStoriesDiscoverTab(text: 'Vines'),
                        ],
                      ),
                    ),
                  ),
                  Container(
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
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/stories2.jpg'),
                              fit: BoxFit.cover,
                            ),
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                          ),

                          margin: EdgeInsets.all(5),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
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
