import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:runwayfashion_app/core/style/app_text_style.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    required this.title,
    required this.prefix,
    required this.suffix,
  });
  final String title;
  final String prefix;
  final String suffix;
  @override
  Size get preferredSize => Size.fromHeight(80);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: preferredSize.height,
      leading: SizedBox.shrink(),
      leadingWidth: 0.0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SvgPicture.asset(prefix, width: 24),
          Text(title, style: TextStyles.text18,),
          SvgPicture.asset(suffix, width: 24),
        ],
      ),
    );
  }
}
