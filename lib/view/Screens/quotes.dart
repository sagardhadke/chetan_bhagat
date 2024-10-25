import 'dart:convert';

import 'package:chetan_bhagat/model/TextQuotes.dart';
import 'package:chetan_bhagat/view/exports/myexports.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyQuotes extends StatefulWidget {
  const MyQuotes({super.key});

  @override
  State<MyQuotes> createState() => _MyQuotesState();
}

class _MyQuotesState extends State<MyQuotes> {
  List<TextQuotes>? ofTextQuotes;

  void getTextQuotes() async {
    try {
      var textQuotesapi = await http.get(Uri.parse(
          "https://mapi.trycatchtech.com/v3/chetan_bhagat/text_quotes"));
      if (textQuotesapi.statusCode == 200) {
        ofTextQuotes = TextQuotes.ofTextQuotes(jsonDecode(textQuotesapi.body));
        print("Api Response ${ofTextQuotes}");
       
      } else {
        print("failed to load API");
      }
    } catch (e) {
      print("Error ${e.toString()}");
    }finally{
      setState(() {
        
      });
    }
  }

  @override
  void initState() {
    getTextQuotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quotes",
        style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),),
        backgroundColor: Colors.orange,
      ),
      body: ofTextQuotes == null ? Center(child: CircularProgressIndicator.adaptive(),) : 
       ListView.builder(
        itemCount: ofTextQuotes!.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Uihelper.buildQuoteCard(
                'assets/quote-empty.png', '${ofTextQuotes![index].textQuote!}'),
          );
        },
      ),
    );
  }
}
