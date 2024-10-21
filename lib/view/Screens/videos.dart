import 'dart:convert';

import 'package:chetan_bhagat/model/VideoStories.dart';
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

  @override
  void initState() {
    videosStoriesApi();
    super.initState();
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
                        return ListTile(
                          title: Text(ofStories![index].title!, style: TextStyle(
                            fontWeight: FontWeight.bold
                          ),),
                          subtitle: Text("Video Url" + ofStories![index].videoUrl!),
                        );
                      }),
                )
              ],
            ),
    );
  }
}
