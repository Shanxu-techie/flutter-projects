import 'package:ecommerce_project/utils/spacing.dart';
import 'package:ecommerce_project/widgets/my_app_bar.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final formKey = GlobalKey<FormState>();
  final cities = [
    "Quetta",
    "Peshawar",
    "Multan",
    "Lahore",
    "Islamabad",
    "Karachi",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.paddingMedium),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Delivery Details",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Spacing.largeY,
                TextFormField(
                  maxLines: 1,
                  keyboardType: TextInputType.name,
                  cursorColor: AppColors.brandColor,
                  decoration: InputDecoration(
                    labelText: "Full Name",
                    filled: true,
                    labelStyle: Theme.of(context).textTheme.bodySmall,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.brandColor,
                        width: 1,
                      ),
                    ),
                    floatingLabelStyle: TextStyle(color: AppColors.brandColor),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "This field is required.";
                    }
                    return null;
                  },
                ),
                Spacing.mediumY,
                TextFormField(
                  maxLines: 1,
                  keyboardType: TextInputType.phone,
                  cursorColor: AppColors.brandColor,
                  decoration: InputDecoration(
                    labelText: "Mobile Number",
                    filled: true,
                    labelStyle: Theme.of(context).textTheme.bodySmall,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.brandColor,
                        width: 1,
                      ),
                    ),
                    floatingLabelStyle: TextStyle(color: AppColors.brandColor),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "This field is required.";
                    } else if (value.length < 11) {
                      return "Enter valid mobile number.";
                    }
                    return null;
                  },
                ),
                Spacing.mediumY,
                TextFormField(
                  maxLines: 4,
                  minLines: 3,
                  keyboardType: TextInputType.streetAddress,
                  cursorColor: AppColors.brandColor,
                  decoration: InputDecoration(
                    labelText: "Delivery Address",
                    filled: true,
                    labelStyle: Theme.of(context).textTheme.bodySmall,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.brandColor,
                        width: 1,
                      ),
                    ),
                    floatingLabelStyle: TextStyle(color: AppColors.brandColor),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "This field is required.";
                    }
                    return null;
                  },
                ),
                Spacing.mediumY,
                DropdownButtonFormField(
                  decoration: InputDecoration(
                    labelText: "City",
                    filled: true,
                    floatingLabelStyle: TextStyle(color: AppColors.brandColor),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColors.brandColor,
                        width: 1,
                      ),
                    ),
                  ),
                  items: cities.map((e) {
                    return DropdownMenuItem(value: e, child: Text(e));
                  }).toList(),
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
