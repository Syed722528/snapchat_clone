import 'package:flutter/material.dart';
import 'package:snapchat_clone/core/constants/app_colors.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SafeArea(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 10,
          itemBuilder: (context, index) {
            if (index == 0) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 40,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text('All'),
                    Text('Unread'),
                    Text('Birthday'),
                    Text('Groups'),
                    Text('Unreplied'),
                    Text('Best Friends'),
                    Text('Streaks'),
                    Text('New'),
                  ],
                ),
              );
            }

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Divider(height: 1),

                ListTile(
                  contentPadding: EdgeInsets.all(5),
                  leading: CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.appGrey,
                    backgroundImage: AssetImage('assets/images/bitmoji.png'),
                  ),
                  title: Text('Name'),
                  subtitle: Row(
                    spacing: 4,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.send, size: 10, color: Colors.red),
                      Text('Deleivered', style: TextStyle(fontSize: 12)),
                      Text('- 2m', style: TextStyle(fontSize: 10)),
                      Text('- 178🔥', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  trailing: Row(
                    spacing: 10,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '|',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.chat_bubble_outline),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
