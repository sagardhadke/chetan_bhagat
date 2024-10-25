import 'package:chetan_bhagat/model/ImageQuotes.dart';
import 'package:chetan_bhagat/view/Screens/imgQuotesDetails.dart';
import 'package:chetan_bhagat/view/exports/myexports.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyImagesCB extends StatefulWidget {
  const MyImagesCB({super.key});

  @override
  State<MyImagesCB> createState() => _MyImagesCBState();
}

class _MyImagesCBState extends State<MyImagesCB> {
  List<ImageQuotes>? ofimgQuotoes;

  void imageQuotesApi() async {
    var imgquApi = await http.get(Uri.parse(
        "https://mapi.trycatchtech.com/v3/chetan_bhagat/image_quotes"));
    if (imgquApi.statusCode == 200) {
      ofimgQuotoes = ImageQuotes.ofimgQuotes(jsonDecode(imgquApi.body));
      // print(ofimgQuotoes);
      setState(() {});
      print(ofimgQuotoes);
    }
  }

  @override
  void initState() {
    imageQuotesApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Quotes",
        style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),),
        backgroundColor: Colors.orange,
      ),
      body: ofimgQuotoes == null
          ? Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : Column(
              children: [
                Expanded(
                  child: GridView.builder(
                      itemCount: ofimgQuotoes!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            print("Click on img");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyImageQuotesDetails(
                                          id: ofimgQuotoes![index].id!,
                                        )));
                          },
                          child: CachedNetworkImage(
                              width: double.infinity,
                              fit: BoxFit.fitWidth,
                              imageUrl: ofimgQuotoes![index].image!),
                        );
                      }),
                )
              ],
            ),
    );
  }
}
