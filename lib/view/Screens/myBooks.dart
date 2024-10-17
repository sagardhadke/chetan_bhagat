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

  //Uri Launcher Code

 Future<void> _launchInBrowserView(String encodedUrl) async {
  // Decode the URL
  final decodedUrl = Uri.decodeFull(encodedUrl);

  // Launch the URL in the external browser
  if (!await launchUrl(
    Uri.parse(decodedUrl), // You can parse it here for launching
    mode: LaunchMode.externalApplication,
  )) {
    throw Exception('Could not launch $decodedUrl'); // Use decodedUrl for the exception message
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
                        print("----OnPress Book LInk-----");
                        _launchInBrowserView(
                            ofbooks![index].bookLinkUrl!);
                        print("This is URi");
                        print(Uri(path: ofbooks![index].bookLinkUrl));
                        // ofbooks![index].bookLinkUrl);
                      },
                      text: ofbooks![index].bookLinkName!,
                      imgUrl: ofbooks![index].bookLinkImage!,
                      context: context);
                }));
  }
}
