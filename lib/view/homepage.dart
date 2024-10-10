import 'package:flutter/material.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chetan Bhagat"),
        backgroundColor: Colors.amber,
      ),
      backgroundColor: Colors.greenAccent,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 3.5,
            width: double.infinity,
            child: Card(
              color: Colors.white,
              elevation: 10,
              shadowColor: Colors.grey,
              child: Column(
                children: [Text("data")],
              ),
            ),
          )
        ],
      ),
    );
  }
}


/**
 * Container(
            height: MediaQuery.sizeOf(context).height / 3.5,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [Text("data")],
            ),
          )
 */
