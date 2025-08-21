import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:runwayfashion_app/core/style/app_text_style.dart';
import 'package:runwayfashion_app/models/category_model.dart';
import 'package:runwayfashion_app/page/categories_page.dart';
import 'package:runwayfashion_app/widgets/custom_appbar.dart';
import 'package:video_player/video_player.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState(); // خليها الأول هنا

    _controller = VideoPlayerController.asset('assets/video/video.mp4')
      ..initialize().then((_) {
        setState(() {
          _controller.play(); // يبدأ الفيديو
        });
      })
      ..setLooping(true);
  }

  List<CategoryModel> category = [
    CategoryModel(name: 'Women', image: 'assets/image/woman.png'),
    CategoryModel(name: 'Men', image: 'assets/image/man.png'),
    CategoryModel(name: 'Kids', image: 'assets/image/kids.png'),
    CategoryModel(name: 'Deals', image: 'assets/image/deals.png'),
    CategoryModel(name: 'Women', image: 'assets/image/woman.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'Runway',
        prefix: 'assets/image/menu.svg',
        suffix: 'assets/image/notiactio.svg',
      ),
      body: Stack(
        children: [
          //vedio
          AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          ),

          /// category
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              width: double.infinity,
              height: 240,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(20),
                  Text('Categories', style: TextStyles.text16),
                  Gap(30),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    child: Row(
                      children: List.generate(category.length, (index) {
                        final item = category[index];
                        return Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (c) => CategoriesPage(),
                              ),
                            ),
                            child: Column(
                              children: [
                                Image.asset(item.image, width: 75),
                                Gap(10),
                                Text(item.name, style: TextStyles.text14),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  Gap(30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
