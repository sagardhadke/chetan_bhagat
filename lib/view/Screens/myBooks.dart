import 'dart:convert';

import 'package:chetan_bhagat/model/Books.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyBooks extends StatefulWidget {
  const MyBooks({super.key});

  @override
  State<MyBooks> createState() => _MyBooksState();
}

class _MyBooksState extends State<MyBooks> {
  List<Books>? ofbooks;
  var apiresponse;

  void getBooksApi() async {
    try {
      var bookapi = await http.get(Uri.parse(
          "https://mapi.trycatchtech.com/v3/chetan_bhagat/book_link"));
      if (bookapi.statusCode == 200) {
        ofbooks = Books.ofbooks(jsonDecode(bookapi.body));
        print("Book API ${ofbooks}");
        setState(() {});
      }
    } catch (e) {
      print("Error ${e.toString()}");
    }
  }

  @override
  void initState() {
    getBooksApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Books",
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        ),
        backgroundColor: Colors.orange,
      ),
      body: ofbooks == null
          ? Center(
              child: CircularProgressIndicator.adaptive(),
            )

          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: ofbooks!.length,
                    itemBuilder: (context, i) {
                      // return Text(ofbooks![i].bookLinkName!);
                      return Container(
                        child: Row(
                          children: [
                            Image.network(
                                height: 100,
                                width: double.infinity,
                                ofbooks![i].bookLinkImage ?? 'N/A'),
                            Text(ofbooks![i].id ?? 'N/A')
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),

    );
  }
}
