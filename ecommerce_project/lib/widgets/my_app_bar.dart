import 'package:ecommerce_project/providers/cart_provider.dart';
import 'package:ecommerce_project/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/cart_page.dart';
import '../utils/images.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (context) {
          bool canPop = ModalRoute.of(context)!.canPop;
          if (!canPop) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  Theme.of(context).textTheme.bodySmall!.color!,
                  BlendMode.srcATop,
                ),
                child: Image.asset(Images.iconMenu),
              ),
            );
          } else {
            return IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.chevron_left,
                color: Theme.of(context).textTheme.bodySmall!.color!,
              ),
            );
          }
        },
      ),
      title: Image.asset(Images.kfcLogo),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (context) => CartPage()));
          },
          icon: SizedBox(
            width: 40,
            child: Stack(
              children: [
                Image.asset(Images.iconCart),
                Center(
                  child: FittedBox(
                    child: Text(
                      Provider.of<CartProvider>(
                        context,
                      ).getCartCount().toString(),
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.lightTextColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ), //agar koi widget us ka samna ajay yani overlap karain
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
