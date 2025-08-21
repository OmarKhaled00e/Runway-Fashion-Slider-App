import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:runwayfashion_app/core/style/app_text_style.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.name,
    required this.price,
    required this.image,
    required this.onTap,
  });
  final String name;
  final String price;
  final String image;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // image
          Container(
            width: 200,
            height: 255,
            decoration: BoxDecoration(
              color: Color(0xffECECEC),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(image),
            ),
          ),
          // name
          Text(name, maxLines: 1, style: TextStyles.text14Meduim),
          Gap(6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              // price
              Text('\$${price}', style: TextStyles.text16),

              Icon(Icons.favorite_border),
            ],
          ),
        ],
      ),
    );
  }
}
