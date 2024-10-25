import 'dart:convert';

import 'package:chetan_bhagat/model/VideoStories.dart';
import 'package:chetan_bhagat/view/exports/myexports.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyVideosCB extends StatefulWidget {
  const MyVideosCB({super.key});

  @override
  State<MyVideosCB> createState() => _MyVideosCBState();
}

class _MyVideosCBState extends State<MyVideosCB> {
  List<VideoStories>? ofStories;

  void videosStoriesApi() async {
    try {
      var videoApi = await http.get(Uri.parse(
          "https://mapi.trycatchtech.com/v3/chetan_bhagat/video_stories"));
      if (videoApi.statusCode == 200) {
        ofStories = VideoStories.ofvideoStories(jsonDecode(videoApi.body));
        print(ofStories);
        setState(() {});
      }
    } catch (e) {
      print("Error ${e.toString()}");
    }
  }

  String? getYTThumb(int index) {
    String? getVideoId() {
      final RegExp regExp = RegExp(
        r'(?:youtu\.be\/|(?:www\.)?youtube\.com\/(?:[^\/\n\s]+\/\S+\/|(?:v|e(?:mbed)?|watch)(?:\S*[?&]v=)|.*[?&]v=))([^&\n]{11})',
      );
      final videoUrls =
          "https://www.youtube.com/watch?v=" + ofStories![index].videoUrl!;
      final match = regExp.firstMatch(videoUrls);
      return match?.group(1);
    }

    final videoId = getVideoId();
    if (videoId == null) {
      return null;
    }

    final thumbnailUrl = 'https://img.youtube.com/vi/$videoId/default.jpg';
    print("Thumbnail URL: $thumbnailUrl");
    return thumbnailUrl;
  }

  @override
  void initState() {
    super.initState();
    videosStoriesApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Stories"),
        backgroundColor: Colors.orange,
      ),
      body: ofStories == null
          ? Center(child: CircularProgressIndicator.adaptive())
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: ofStories!.length,
                      itemBuilder: (BuildContext context, int index) {
                        final thumbnailUrl = getYTThumb(index);

                        return ListTile(
                            title: Text(
                              ofStories![index].title!,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle:
                                Text("Video Url" + ofStories![index].videoUrl!),
                            leading: thumbnailUrl == null
                                ? Center(
                                    child: CircularProgressIndicator.adaptive())
                                : CachedNetworkImage(
                                    height: 75,
                                    width: 75,
                                    imageUrl: thumbnailUrl,
                                    errorWidget: (context, url, error) =>
                                        Image.asset("assets/novideo.png")));
                      }),
                )
              ],
            ),
    );
  }
}
