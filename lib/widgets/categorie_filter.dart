import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:runwayfashion_app/core/style/app_text_style.dart';

class CategorieFileter extends StatelessWidget {
  const CategorieFileter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Text('Sort by', style: TextStyles.text14),
            Gap(10),
            SvgPicture.asset('assets/image/select.svg'),
            Spacer(),
            SvgPicture.asset('assets/image/fliter.svg'),
            Gap(10),
            Text('Filter', style: TextStyles.text14),
            Gap(20),
            SvgPicture.asset('assets/image/grid.svg'),
            Gap(20),
            SvgPicture.asset('assets/image/groups.svg'),
          ],
        ),
      ),
    );
  }
}
