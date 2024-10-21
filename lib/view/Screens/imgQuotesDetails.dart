import 'dart:convert';

import 'package:chetan_bhagat/view/exports/myexports.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyImageQuotesDetails extends StatefulWidget {
  final String id;
  const MyImageQuotesDetails({super.key, required this.id});

  @override
  State<MyImageQuotesDetails> createState() => _MyImageQuotesDetailsState();
}

class _MyImageQuotesDetailsState extends State<MyImageQuotesDetails> {
  var response;

  void imgQuotesDetailsApi() async {
    try {
      var imgQuotoesDApi = await http.get(Uri.parse(
          "https://mapi.trycatchtech.com/v3/chetan_bhagat/single_image_quotes?id=" +
              widget.id));
      if (imgQuotoesDApi.statusCode == 200) {
        response = jsonDecode(imgQuotoesDApi.body);
        print(response);
        setState(() {});
      }
    } catch (e) {
      print("Error ${e.toString()}");
    }
  }

  @override
  void initState() {
    imgQuotesDetailsApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Quotes Details"),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          response == null
              ? Center(
                  child: CircularProgressIndicator.adaptive(),
                )
              : CachedNetworkImage(imageUrl: response['image'])
        ],
      ),
    );
  }
}
