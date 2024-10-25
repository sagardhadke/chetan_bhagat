import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyStoriesDetails extends StatefulWidget {
  final String id;
  const MyStoriesDetails({super.key, required this.id});

  @override
  State<MyStoriesDetails> createState() => _MyStoriesDetailsState();
}

class _MyStoriesDetailsState extends State<MyStoriesDetails> {
  Map<String, dynamic>? userResponse;
  bool isLoading = true; // Loading state

  void textStoriesDetailsApi() async {
    try {
      final response = await http.get(Uri.parse(
          "https://mapi.trycatchtech.com/v3/chetan_bhagat/single_text_stories?id=${widget.id}"));
      if (response.statusCode == 200) {
        userResponse = jsonDecode(response.body);
        print("---Single Text Stories Api Response--- $userResponse");
      } else {
        print("Server error: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: ${e.toString()}");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    textStoriesDetailsApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stories Details",
        style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),),
        backgroundColor: Colors.orange,
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : userResponse != null
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("assets/stories.png"),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          userResponse!["title"] ?? "No Title Found",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          userResponse!['text_stories'] ?? 'No stories Found',
                        ),
                      )
                    ],
                  ),
                )
              : Center(child: Text("Failed to load story details")),
    );
  }
}
