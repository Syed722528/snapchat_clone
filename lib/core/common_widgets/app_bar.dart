import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

PreferredSizeWidget buildAppBar(
  IconButton button,
  String title,
  Color iconColor,
) {
  return AppBar(
    backgroundColor: Colors.transparent,
    iconTheme: IconThemeData(color: iconColor),
    leading: Row(
      children: [
        Expanded(child: SvgPicture.asset('assets/icons/emoji.svg')),
        Expanded(child: SvgPicture.asset('assets/icons/Search.svg')),
      ],
    ),
    actions: [SvgPicture.asset('assets/icons/Friend add.svg'), button],
    title: Text(title),
    centerTitle: true,
  );
}
