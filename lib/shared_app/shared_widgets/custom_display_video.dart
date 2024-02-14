import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tourist_tour_app/shared_app/shared_widgets/custom_video_player.dart';

class VideoScreen extends StatelessWidget {
  final String videoUrl;

  const VideoScreen({required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video'),
        centerTitle: true,
      ),
      body: Center(
        child: VideoPlayerWidget(videoUrl: videoUrl),
      ),
    );
  }
}
