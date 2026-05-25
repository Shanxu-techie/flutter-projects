import 'package:ecommerce_project/pages/main_page.dart';
import 'package:ecommerce_project/utils/colors.dart';
import 'package:ecommerce_project/utils/dimensions.dart';
import 'package:ecommerce_project/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';

import '../utils/images.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              DrawerHeader(
                // decoration: BoxDecoration(),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(Images.kfcLogo),
                      Text(
                        "It's Finger Lickin' Good",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      // Row(
                      //   children: [
                      //     Icon(
                      //       Icons.person,
                      //       color: Theme.of(context).textTheme.bodySmall!.color,
                      //     ),
                      //     Spacing.smallX,
                      //     Text("Username", style: Theme.of(context).textTheme.bodySmall,),
                      //     Spacer(),
                      //     FilledButton(onPressed: () {}, child: Text("Logout")),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Container(
                  padding: EdgeInsets.all(Dimensions.paddingSmall * 0.5),
                  decoration: BoxDecoration(
                    color: AppColors.brandColor,
                    borderRadius: BorderRadius.circular(
                      Dimensions.borderRadiusSmall,
                    ),
                  ),
                  child: Icon(
                    Icons.location_pin,
                    color: AppColors.buttonTextColor,
                    size: 20,
                  ),
                ),
                title: Text(
                  "Store Locator",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              ListTile(
                leading: Container(
                  padding: EdgeInsets.all(Dimensions.paddingSmall * 0.5),
                  decoration: BoxDecoration(
                    color: AppColors.brandColor,
                    borderRadius: BorderRadius.circular(
                      Dimensions.borderRadiusSmall,
                    ),
                  ),
                  child: Icon(
                    Icons.search,
                    color: AppColors.buttonTextColor,
                    size: 20,
                  ),
                ),
                title: Text(
                  "Track Order",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              ListTile(
                leading: Container(
                  padding: EdgeInsets.all(Dimensions.paddingSmall * 0.5),
                  decoration: BoxDecoration(
                    color: AppColors.brandColor,
                    borderRadius: BorderRadius.circular(
                      Dimensions.borderRadiusSmall,
                    ),
                  ),
                  child: Icon(
                    Icons.list,
                    color: AppColors.buttonTextColor,
                    size: 20,
                  ),
                ),
                title: Text(
                  "Explore Menu",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              Divider(),
              // Divider(color: Theme.of(context).textTheme.bodySmall!.color),
              ListTile(
                // onTap: () {
                //
                // },
                title: Text(
                  "About Us",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              ListTile(
                title: Text(
                  "Terms & Conditions",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              ListTile(
                title: Text(
                  "Privacy Policy",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              ListTile(
                title: Text(
                  "Contact Us",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              ListTile(
                title: Text(
                  "Mitao Bhook",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              ListTile(
                title: Text(
                  "Mitao Bhook - Scholarship",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              ListTile(
                title: Text(
                  "Careers",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
      ),
      body: MainPage(),
      // body: Column(children: [
      //   Text("Hello"),
      //   Spacing.smallY,
      //   Text("Welcome")
      // ]),
    );
  }
}
