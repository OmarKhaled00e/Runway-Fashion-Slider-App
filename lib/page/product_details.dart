import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:runwayfashion_app/core/style/app_text_style.dart';
import 'package:runwayfashion_app/models/product_model.dart';
import 'package:runwayfashion_app/widgets/categorie_filter.dart';
import 'package:runwayfashion_app/widgets/custom_appbar.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, this.image, this.name, this.price});
  final String? image, name, price;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showBottomSheet();
    });
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.17,
          minChildSize: 0.17,
          maxChildSize: 0.8,
          expand: false,
          builder: (BuildContext context, ScrollController scrollController) {
            return BottomWidget(scrollController, widget.name, widget.price);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Men',
        onTap: () => Navigator.pop(context),
        prefix: 'assets/image/arrow-left.svg',
        suffix: 'assets/image/bag.svg',
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            CategorieFileter(),
            Gap(13),

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
                child: SizedBox(
                  width: 250,
                  height: 600,
                  child: Image.asset(widget.image.toString()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// bottomSheetWidget
Widget BottomWidget(scroll, name, price) {
  return Container(
    height: 170,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    padding: const EdgeInsets.all(16),
    child: ListView(
      controller: scroll,
      children: [
        Center(
          child: Container(
            width: 42,
            height: 6,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        Gap(10),
        Text(name.toString(), maxLines: 1, style: TextStyles.text14Meduim),
        Gap(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            // price
            Text('\$${price}', style: TextStyles.text16),
            Icon(Icons.favorite_border),
            Gap(10),
            Text('450', style: TextStyles.text16),
          ],
        ),
        Gap(20),
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            border: Border.all(
              width: 0.7,
              color: Colors.black12,
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text('Sort by', style: TextStyles.text14),
                  Gap(10),
                  SvgPicture.asset('assets/image/select.svg'),
                ],
              ),
              Container(
                width: 2,
                height: 40,
                color: Colors.black12,
              ),

              Row(
                children: [
                  Text('Select size', style: TextStyles.text14),
                  Gap(10),
                  SvgPicture.asset('assets/image/select.svg'),
                ],
              ),
            ],
          ),
        ),
        Gap(20),
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Colors.black
          ),
          child: Center(child: Text('Add To Bag', style: TextStyles.text16White,)),
        )
      ],
    ),
  );
}
