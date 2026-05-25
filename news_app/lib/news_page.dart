import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/news_item.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  Future<List<NewsItem>> getNewsData() async {
    http.Response response = await http.get(
      Uri.parse(
        "https://androidstudent.com/apis/thenews/news.php?category=${newsCategories[selectedCategoryIndex]["url"]}",
      ),
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      List<NewsItem> newsList = jsonData
          .map((e) => NewsItem.fromJson(e))
          .toList();
      // print(newsList.length);
      return newsList;
    } else {
      throw Exception("Unable to fetch news data");
    }
  }

  late Future<List<NewsItem>> newsFuture;

  @override
  void initState() {
    super.initState();
    newsFuture = getNewsData();
  }

  List<Map<String, String>> newsCategories = [
    {"name": "World", "url": "world"},
    {"name": "Sports", "url": "sports"},
    {"name": "Entertainment", "url": "entertainment"},
    {"name": "Science", "url": "science"},
    {"name": "Health", "url": "health"},
    {"name": "Trending", "url": "trending"},
    {"name": "Technology", "url": "technology"},
  ];

  int selectedCategoryIndex = 0;

  void launchNewsLink(String link) async {
    Uri newsUri = Uri.parse(link);
    if (await canLaunchUrl(newsUri)) {
      launchUrl(newsUri);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Unable to open news link")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 60,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: newsCategories.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedCategoryIndex = index;
                    newsFuture = getNewsData();
                  });
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  child: Chip(
                    backgroundColor: selectedCategoryIndex == index
                        ? Theme.of(context).colorScheme.primary
                        : Colors.transparent,
                    labelStyle: selectedCategoryIndex == index
                        ? Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                          )
                        : Theme.of(context).textTheme.bodyMedium,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(50),
                    ),
                    label: Text(newsCategories[index]["name"]!),
                  ),
                ),
              );
            },
          ),
        ),
        Expanded(
          child: FutureBuilder(
            future: newsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Error: ${snapshot.error}"),
                      SizedBox(height: 8),
                      OutlinedButton(
                        onPressed: () {
                          setState(() {
                            newsFuture = getNewsData();
                          });
                        },
                        child: Text("Retry"),
                      ),
                    ],
                  ),
                );
              } else if (snapshot.hasData && snapshot.data != null) {
                final newsList = snapshot.data!;
                return ListView.builder(
                  itemCount: newsList.length,
                  itemBuilder: (context, index) {
                    final newsItem = newsList[index];
                    if (index == 0) {
                      return Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 8,
                        ),
                        child: InkWell(
                          //inkwell main tap par effect ata ha aur gesture detector par ki effect nhi ata ha
                          //grey color ka effect rounded corners agar hon to us sa bahir nikalta ha is lye order radius select karna ha
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            launchNewsLink(newsItem.link);
                          },
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: AspectRatio(
                                      aspectRatio: 4 / 3,
                                      child: Image.network(
                                        newsItem.image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    newsItem.publishDate,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodySmall,
                                  ),
                                  Text(
                                    newsItem.title,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.titleMedium,
                                  ),
                                  Text(
                                    newsItem.detail,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 4,
                          horizontal: 8,
                        ),
                        child: Card(
                          child: InkWell(
                            borderRadius: BorderRadius.circular(10),
                            onTap: () async {
                              launchNewsLink(newsItem.link);
                            },
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: AspectRatio(
                                        aspectRatio: 4 / 3,
                                        child: Image.network(
                                          newsItem.image,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Expanded(
                                    flex: 6,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          newsItem.publishDate,
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodySmall,
                                        ),
                                        Text(
                                          newsItem.title,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(
                                            context,
                                          ).textTheme.titleMedium,
                                        ),
                                        Text(
                                          newsItem.detail,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodyMedium,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  },
                );
              } else {
                return Center(child: Text("No data available"));
              }
            },
          ),
        ),
      ],
    );
  }
}
