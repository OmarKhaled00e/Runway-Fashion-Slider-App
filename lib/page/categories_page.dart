import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:runwayfashion_app/core/style/app_text_style.dart';
import 'package:runwayfashion_app/models/product_model.dart';
import 'package:runwayfashion_app/page/product_details.dart';
import 'package:runwayfashion_app/widgets/categorie_filter.dart';
import 'package:runwayfashion_app/widgets/custom_appbar.dart';
import 'package:runwayfashion_app/widgets/product_item.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<ProductModel> products = [
      ProductModel(
        image: 'assets/image/block.png',
        price: '20',
        name: 'Top man black',
      ),
      ProductModel(
        image: 'assets/image/white.png',
        price: '30',
        name: 'Gray coat and white T-shiret',
      ),
      ProductModel(
        image: 'assets/image/brown.png',
        price: '30',
        name: 'Deep gray essential regul..',
      ),
      ProductModel(
        image: 'assets/image/green.png',
        price: '28',
        name: 'Lightweight Men\'s Puffer Jacket',
      ),
      ProductModel(
        image: 'assets/image/greycost.png',
        price: '30',
        name: 'Gray coat and white T-sh..',
      ),
    ];
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Men',
        prefix: 'assets/image/arrow-left.svg',
        suffix: 'assets/image/bag.svg',
      ),

      body: Column(
        children: [
          // first section
          CategorieFileter(),
          Gap(13),

          /// product
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1 / 1.8,
                ),
                itemBuilder: (context, index) {
                  final item = products[index];
                  return ProductItem(
                    image: item.image,
                    price: item.image,
                    name: item.name,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (c) => ProductDetails(
                          image: item.image,
                          name: item.name,
                          price: item.price,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
