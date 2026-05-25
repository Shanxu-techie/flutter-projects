import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:ecommerce_project/pages/menu_page.dart';
import 'package:ecommerce_project/providers/cart_provider.dart';
import 'package:ecommerce_project/utils/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import '../utils/images.dart';
import '../utils/spacing.dart';
import '../widgets/brand_decoration.dart';
import '../widgets/brand_underline.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static const List<String> sliderImages = [
    Images.slider1,
    Images.slider2,
    Images.slider3,
    Images.slider4,
    Images.slider5,
  ];

  final categoriesFuture = Supabase.instance.client
      .from('Categories')
      .select()
      .order("categoryId", ascending: true);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              // height: MediaQuery.of(context).size.width * (6 / 16),
              aspectRatio: 25 / 9,
              viewportFraction: 1.0,
              autoPlay: true,
              // enableInfiniteScroll: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              // scrollDirection: Axis.horizontal,
            ),
            items: sliderImages.map((imageUrl) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: Image.asset(imageUrl, fit: BoxFit.cover),
              );
            }).toList(),
          ),
          Padding(
            padding: EdgeInsets.all(Dimensions.paddingMedium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "EXPLORE MENU",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        BrandUnderLine(),
                      ],
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MenuPage()),
                        );
                      },
                      child: Text("View All"),
                    ),
                  ],
                ),
                Spacing.smallY,
                FutureBuilder(
                  future: categoriesFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text("Error: ${snapshot.error}"));
                    } else if (snapshot.hasData && snapshot.data != null) {
                      final menuCategories = snapshot.data!;
                      return StaggeredGrid.count(
                        crossAxisCount: 3,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        children: menuCategories.getRange(0, 5).map((item) {
                          return StaggeredGridTile.count(
                            crossAxisCellCount: 1,
                            mainAxisCellCount: menuCategories.indexOf(item) == 0
                                ? 2
                                : 1,
                            child: DottedBorder(
                              options: RoundedRectDottedBorderOptions(
                                dashPattern: [6, 3],
                                padding: EdgeInsets.all(
                                  Dimensions.paddingSmall,
                                ),
                                radius: Radius.circular(
                                  Dimensions.borderRadiusSmall,
                                ),
                                color: Theme.of(
                                  context,
                                ).textTheme.bodyMedium!.color!,
                              ),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(
                                  Dimensions.borderRadiusSmall,
                                ),
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => MenuPage(
                                        selectedCategoryName: item['name']!,
                                      ),
                                    ),
                                  );
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item['name']!,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodySmall,
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Image.network(item['image'] ?? "https://placehold.co/300x300.jpg"),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    } else {
                      return Center(child: Text("No data available"));
                    }
                  },
                ),
                Spacing.mediumY,
                Text(
                  "BEST SELLERS",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                BrandUnderLine(),
                Spacing.smallY,
                SizedBox(
                  height: 340,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: bestSellersList.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 220,
                        child: Card(
                          child: Column(
                            children: [
                              BrandDecoration(),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(
                                    Dimensions.paddingMedium,
                                  ),
                                  child: Column(
                                    children: [
                                      Spacing.mediumY,
                                      Text(
                                        bestSellersList[index]["name"]!,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.headlineMedium,
                                      ),
                                      Spacing.mediumY,
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: Dimensions.paddingLarge,
                                            vertical:
                                                Dimensions.paddingSmall * 0.7,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              Dimensions.borderRadiusSmall,
                                            ),
                                            color: AppColors.brandColor,
                                          ),
                                          child: Text(
                                            "Rs. ${bestSellersList[index]["price"]}",
                                            style: TextStyle(
                                              color: AppColors.buttonTextColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: Image.asset(
                                            bestSellersList[index]["image"]!,
                                          ),
                                        ),
                                      ),
                                      FilledButton.icon(
                                        icon: Icon(Icons.add),
                                        onPressed: () {
                                          Provider.of<CartProvider>(
                                            context,
                                            listen: false,
                                          ).addItem(bestSellersList[index]);
                                        },
                                        label: Text(
                                          "ADD TO BUCKET",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Spacing.mediumY,
                Text(
                  "TOP DEALS",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                BrandUnderLine(),
                Spacing.smallY,
                SizedBox(
                  height: 380,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: topDealsList.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 220,
                        child: Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BrandDecoration(),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(
                                    Dimensions.paddingMedium,
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: Center(
                                          child: Image.asset(
                                            topDealsList[index]["image"]!,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        topDealsList[index]["name"]!,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.headlineMedium,
                                      ),
                                      Spacing.smallY,
                                      Text(
                                        topDealsList[index]["description"]!,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodySmall,
                                      ),
                                      Spacing.smallY,
                                      Text(
                                        "Rs. ${topDealsList[index]["price"]}",
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodyMedium,
                                      ),
                                      Center(
                                        child: FilledButton.icon(
                                          icon: Icon(Icons.add),
                                          onPressed: () {
                                            Provider.of<CartProvider>(
                                              context,
                                              listen: false,
                                            ).addItem(bestSellersList[index]);
                                          },
                                          label: Text(
                                            "ADD TO BUCKET",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Spacing.mediumY,
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    Dimensions.borderRadiusSmall,
                  ),
                  child: Image.asset(Images.homeBanner1),
                ),
                Spacing.mediumY,
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    Dimensions.borderRadiusSmall,
                  ),
                  child: Image.asset(Images.homeBanner2),
                ),
                Spacing.mediumY,
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    Dimensions.borderRadiusSmall,
                  ),
                  child: Image.asset(Images.homeBanner3),
                ),
              ],
            ),
          ),
          //slider - offers & prmotions
          //grid - categories
          //horizontal list
          //horizontal list
          //3 images
        ],
      ),
    );
  }
}
