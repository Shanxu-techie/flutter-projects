// Topic: Full Screen — HTTP + FutureBuilder + Model Class
// Given this model class:
// class Post {
// final String title;
// final String body;
//
// Post({required this.title, required this.body});
//
// factory Post.fromJson(Map<String, dynamic> json) {
// return Post(title: json['title'], body: json['body']);
// }
// }
// Write a complete StatefulWidget called PostsPage that:
//
// Fetches from "https://jsonplaceholder.typicode.com/posts"
// Returns Future<List<Post>>
// Uses FutureBuilder to show CircularProgressIndicator while loading
// On success shows ListView.builder with each post's title in a ListTile
// On error shows Text("Error: ${snapshot.error}")
// Initializes future in initState

import "package:flutter/material.dart";
import "post.dart";
import "dart:convert";
import "package:http/http.dart" as http;

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  late Future<List<Post>> postFuture;

  Future<List<Post>> getPostData() async {
    final Uri postUri = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    http.Response response = await http.get(postUri);
    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      List<Post> postsList = jsonData.map((e) => Post.fromJson(e)).toList();
      return postsList;
    } else {
      throw Exception("Unable to fetch posts");
    }
  }

  @override
  void initState() {
    super.initState();
    postFuture = getPostData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FutureBuilder(
            future: postFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData && snapshot.data != null) {
                final postsList = snapshot.data!;
                return Center(
                  child: ListView.builder(
                    itemCount: postsList.length,
                    itemBuilder: (context, index) {
                      final post = postsList[index];
                      return ListTile(title: Text(post.title));
                    },
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              } else {
                return Center(child: Text("No data available."));
              }
            },
          ),
        ),
      ],
    );
  }
}
