import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YouTubeVideoWeb extends StatefulWidget {
  final String videoUrl;
  const YouTubeVideoWeb({super.key, required this.videoUrl});

  @override
  _YouTubeVideoWebState createState() => _YouTubeVideoWebState();
}

class _YouTubeVideoWebState extends State<YouTubeVideoWeb> {
  late YoutubePlayerController _controller;

  // دالة بسيطة لاستخراج videoId من الرابط
  String getVideoId(String url) {
    Uri uri = Uri.parse(url);
    if (uri.queryParameters.containsKey('v')) {
      return uri.queryParameters['v']!;
    } else {
      return uri.pathSegments.last;
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController.fromVideoId(
      videoId: getVideoId(widget.videoUrl),
      autoPlay: false,
      params: const YoutubePlayerParams(showFullscreenButton: true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(controller: _controller, aspectRatio: 16 / 9);
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}
