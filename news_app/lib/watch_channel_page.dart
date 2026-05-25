import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WatchChannelPage extends StatefulWidget {
  final String name;
  final String videoId;

  const WatchChannelPage({
    super.key,
    required this.name,
    required this.videoId,
  });

  @override
  State<WatchChannelPage> createState() => _WatchChannelPageState();
}

class _WatchChannelPageState extends State<WatchChannelPage> {
  late YoutubePlayerController ytController = YoutubePlayerController(
    initialVideoId: widget.videoId,
    flags: YoutubePlayerFlags(
      autoPlay: true,
      mute: false,
      isLive: true,
      showLiveFullscreenButton: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(title: Text(widget.name)),
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: ytController,
          // bottomActions: [FullScreenButton()],
        ),
        builder: (context, player) {
          return Center(child: player);
        },
      ),
    );
  }
}
