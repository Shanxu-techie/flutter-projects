import 'package:flutter/material.dart';
import 'package:news_app/live_news_page.dart';
import 'package:news_app/news_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget currentBodyPage = NewsPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Live"),
        actions: [
          PopupMenuButton(
            itemBuilder: (context) {
              return [PopupMenuItem(child: Text("Rate App"))];
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(radius: 26, backgroundColor: Colors.grey),
                    SizedBox(height: 10),
                    Text(
                      "News Live",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(height: 2),
                    Text(
                      "powered by thenews.com.pk",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              selected: currentBodyPage is NewsPage,
              onTap: () {
                setState(() {
                  if(currentBodyPage is! NewsPage){
                    currentBodyPage = NewsPage();
                  }
                });
                Navigator.of(context).pop();
              },
              leading: Icon(Icons.home),
              title: Text("Home"),
            ),
            ListTile(
              selected: currentBodyPage is LiveNewsPage,
              onTap: () {
                setState(() {
                  if(currentBodyPage is! LiveNewsPage){
                    currentBodyPage = LiveNewsPage();
                  }
                });
                Navigator.of(context).pop();
              },
              leading: Icon(Icons.tv),
              title: Text("Watch Live News"),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.check),
              title: Text("Subscribe"),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.shopping_cart),
              title: Text("Shop"),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.phone),
              title: Text("Contact"),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.settings),
              title: Text("Settings"),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.cases_rounded),
              title: Text("Careers"),
            ),
          ],
        ),
      ),
      body: currentBodyPage,
    );
  }
}
