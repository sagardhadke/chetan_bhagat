import 'package:chetan_bhagat/view/exports/myexports.dart';
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

  Future<void> _launchInBrowserView(Uri url) async {
    // if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
    //   throw Exception('Could not launch $url');
    // }
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(enableJavaScript: false),
    )) {
      throw Exception('Could not launch $url');
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
            : GridView.builder(
                itemCount: ofbooks!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return Uihelper.customContainerNetwork(
                      callback: () {
                        _launchInBrowserView(
                            Uri(path: ofbooks![index].bookLinkImage));
                        print("This is URi");
                        print(Uri(path: ofbooks![index].bookLinkUrl));
                        // ofbooks![index].bookLinkUrl);
                      },
                      text: ofbooks![index].bookLinkName!,
                      imgUrl: ofbooks![index].bookLinkImage!,
                      context: context);
                  // return Container(
                  //   height: 350,
                  //   color: Colors.amber,
                  //   child: Column(
                  //     children: [
                  //       CachedNetworkImage(
                  //           height: 180,
                  //           width: double.infinity,
                  //           fit: BoxFit.cover,
                  //           imageUrl: ofbooks![index].bookLinkImage ?? 'N/A'),
                  //       SizedBox(height: 15),
                  //       Text(ofbooks![index].bookLinkName ?? 'N/A')
                  //     ],
                  //   ),
                  // );
                })

       
        );
  }
}
