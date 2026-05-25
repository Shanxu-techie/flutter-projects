import 'package:flutter/material.dart';
import 'package:news_app/watch_channel_page.dart';

class LiveNewsPage extends StatefulWidget {
  const LiveNewsPage({super.key});

  @override
  State<LiveNewsPage> createState() => _LiveNewsPageState();
}

class _LiveNewsPageState extends State<LiveNewsPage> {
  List<Map<String, String>> newsChannels = [
    {
      "name":
          "ARY NEWS LIVE | Latest Pakistan News 𝟐𝟒/𝟕 | Headlines, Bulletins, Breaking News",
      "image": "https://img.youtube.com/vi/vYTfRrA0rBw/maxresdefault.jpg",
      "ytVideoID": "vYTfRrA0rBw",
    },
    {
      "name":
          "Geo News Live: Latest 𝗣𝗮𝗸𝗶𝘀𝘁𝗮𝗻 𝗡𝗲𝘄𝘀 Live 𝟐4/𝟕 Breaking News & Headlines (Today News)",
      "image": "https://img.youtube.com/vi/_FwympjOSNE/maxresdefault.jpg",
      "ytVideoID": "_FwympjOSNE",
    },
    {
      "name":
          "𝗟𝗶𝘃𝗲 𝗗𝘂𝗻𝘆𝗮 𝗡𝗲𝘄𝘀: 24/7 Non-Stop Coverage | Headlines, Breaking News from Pakistan & Top TV Shows",
      "image": "https://img.youtube.com/vi/GlHSFtTFfJE/maxresdefault.jpg",
      "ytVideoID": "GlHSFtTFfJE",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: newsChannels.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 6, horizontal: 8),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => WatchChannelPage(
                      name: newsChannels[index]['name']!,
                      videoId: newsChannels[index]['ytVideoID']!,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(newsChannels[index]['image']!),
                    ),
                    SizedBox(height: 10),
                    Text(
                      newsChannels[index]['name']!,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
