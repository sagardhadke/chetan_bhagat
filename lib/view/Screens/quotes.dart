import 'package:flutter/material.dart';

class MyQuotes extends StatefulWidget {
  const MyQuotes({super.key});

  @override
  State<MyQuotes> createState() => _MyQuotesState();
}

class _MyQuotesState extends State<MyQuotes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quotes"),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          
        ],
      ),
    );
  }
}
