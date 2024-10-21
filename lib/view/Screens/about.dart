import 'package:chetan_bhagat/view/exports/myexports.dart';
import 'package:flutter/material.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: CachedNetworkImage(
                  height: 250,
                  width: 250,
                  fit: BoxFit.fill,
                  imageUrl:
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Chetan_bhagat_1.jpg/330px-Chetan_bhagat_1.jpg")),
          SizedBox(height: 10),
          Text(
            "Chetan Bhagat",
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Born :- Chetan Prakash Bhagat, 22 April 1974 (age 50), New Delhi, India",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                style: TextStyle(fontSize: 15),
                "Chetan Bhagat (born 22 April 1974)[1] is an Indian author, columnist, screenwriter and YouTuber. He was listed in Time magazine's list of World's 100 Most Influential People in 2010.[2] Five of his novels have been adapted into films. His novels focus on youth and urban India, which has made him very popular among metropolitan audiences and garnering a strong following from Indian youth."),
          )
        ],
      ),
    );
  }
}
