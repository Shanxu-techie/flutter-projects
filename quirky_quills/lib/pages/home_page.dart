import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:quirky_quills/widgets/my_app_bar.dart';

import '../utils/colors.dart';
import '../utils/data.dart';

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
      drawer: Drawer(),
      body: Column(
        children: [
          Container(
            color: AppColors.brandColor,
            child: CarouselSlider(
              options: CarouselOptions(height: 400.0,viewportFraction: 0.8),
              items: featuredBooks.map((index) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(color: AppColors.popColor),
                      child: Text('text $index', style: TextStyle(fontSize: 16.0)),
                    );
                  },
                );
              }).toList(),
            ),
          )

        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:quirky_quills/widgets/my_app_bar.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   final List<String> genres = [
//     "Fantasy",
//     "Mystery",
//     "Romance",
//     "Sci-Fi",
//     "Horror",
//   ];
//
//   final Set<String> selectedGenres = {
//     "Fantasy",
//     "Romance",
//   };
//
//   @override
//   Widget build(BuildContext context) {
//     final textTheme = Theme.of(context).textTheme;
//
//     return Scaffold(
//       appBar: const MyAppBar(),
//       drawer: const Drawer(),
//
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//
//           children: [
//             Text(
//               "Chip Theme Test",
//               style: textTheme.headlineLarge,
//             ),
//
//             const SizedBox(height: 8),
//
//             Text(
//               "Tap chips to test selected and unselected states.",
//               style: textTheme.bodyMedium,
//             ),
//
//             const SizedBox(height: 24),
//
//             Wrap(
//               spacing: 10,
//               runSpacing: 10,
//
//               children: genres.map((genre) {
//                 final isSelected =
//                 selectedGenres.contains(genre);
//
//                 return FilterChip(
//                   label: Text(genre),
//
//                   selected: isSelected,
//
//                   onSelected: (value) {
//                     setState(() {
//                       if (value) {
//                         selectedGenres.add(genre);
//                       } else {
//                         selectedGenres.remove(genre);
//                       }
//                     });
//                   },
//                 );
//               }).toList(),
//             ),
//
//             const SizedBox(height: 32),
//
//             Card(
//               child: Padding(
//                 padding: const EdgeInsets.all(16),
//
//                 child: Column(
//                   crossAxisAlignment:
//                   CrossAxisAlignment.start,
//
//                   children: [
//                     Text(
//                       "Theme Preview",
//                       style: textTheme.headlineMedium,
//                     ),
//
//                     const SizedBox(height: 12),
//
//                     Text(
//                       "This card helps test your card colors, "
//                           "text theme, and chip theme together.",
//                       style: textTheme.bodyMedium,
//                     ),
//
//                     const SizedBox(height: 16),
//
//                     FilledButton(
//                       onPressed: () {},
//                       child: const Text("Explore Books"),
//                     ),
//
//                     const SizedBox(height: 12),
//
//                     TextButton(
//                       onPressed: () {},
//                       child: const Text("View Wishlist"),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
