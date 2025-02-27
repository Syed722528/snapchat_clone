import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

PreferredSizeWidget buildAppBar(
  IconButton button,
  String title,
  Color iconColor,
) {
  return AppBar(
    backgroundColor: Colors.transparent,
    automaticallyImplyLeading: false,

    iconTheme: IconThemeData(color: iconColor),
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset('assets/images/bitmoji.png', height: 45, width: 45),
        SvgPicture.asset('assets/icons/Search.svg'),
        Expanded(
          child: Center(
            child: Text(title, style: TextStyle(fontWeight: FontWeight.w400)),
          ),
        ),
      ],
    ),

    actions: [SvgPicture.asset('assets/icons/Friend add.svg'), button],

    centerTitle: true,
  );
}
