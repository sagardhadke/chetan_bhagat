import 'dart:convert';

import 'package:chetan_bhagat/model/TextStories.dart';
import 'package:chetan_bhagat/view/Screens/storiesDetails.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:readmore/readmore.dart';

class MotivationalStories extends StatefulWidget {
  const MotivationalStories({super.key});

  @override
  State<MotivationalStories> createState() => _MotivationalStoriesState();
}

class _MotivationalStoriesState extends State<MotivationalStories> {
  List<TextStories>? ofstories;

  void fetchTextStores() async {
    try {
      var textStoriesApi = await http.get(Uri.parse(
          "https://mapi.trycatchtech.com/v3/chetan_bhagat/text_stories"));
      ofstories = TextStories.ofstories(jsonDecode(textStoriesApi.body));

      print("----Text Stories API ${ofstories}----");
      setState(() {});
    } catch (e) {
      print("----Error ${e.toString()}------");
    }
  }

  @override
  void initState() {
    fetchTextStores();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Stories",
        style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),),
        backgroundColor: Colors.orange,
      ),
      body: ofstories == null
          ? Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: ofstories!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyStoriesDetails(
                                        id: ofstories![index].id.toString())));
                          },
                          child: ListTile(
                            leading: Icon(Icons.auto_stories_outlined),
                            title: Text(
                              ofstories![index].title ??
                                  'Server Failed to load title',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              ofstories![index].textStories ??
                                  'Server Failed to load Stories',
                              
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
    );
  }
}
