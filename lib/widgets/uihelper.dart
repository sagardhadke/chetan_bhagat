import 'package:chetan_bhagat/view/exports/myexports.dart';

class Uihelper {
  //Container
  static customContainer(
      {required VoidCallback callback,
      required String text,
      required String imgUrl,
      required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        alignment: Alignment.center,
        height: 150,
        width: MediaQuery.sizeOf(context).width / 2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: GestureDetector(
          onTap: callback,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imgUrl,
                height: 95,
                width: 95,
              ),
              SizedBox(height: 10),
              Text(
                textAlign: TextAlign.center,
                text,
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }

  //network
  static customContainerNetwork(
      {required VoidCallback callback,
      required String text,
      required String imgUrl,
      required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        child: GestureDetector(
          onTap: callback,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Container(
                child: 
                CachedNetworkImage(imageUrl: imgUrl,height: 145,
                  width: double.infinity,
                  fit: BoxFit.fill,),
                
              )),
              SizedBox(height: 10),
              Text(
                textAlign: TextAlign.center,
                text,
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Dashboard Data

  static void pushScreen(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  static List<Map<String, dynamic>> dashboardData(BuildContext context) {
    return [
      {
        "images": "assets/book.png",
        "onTap": () => pushScreen(context, MyBooks()),
        "text": "Book"
      },
      {
        "images": "assets/motivation.png",
        "onTap": () => pushScreen(context, MotivationalStories()),
        "text": "Motivational Stories"
      },
      {
        "images": "assets/quotes.png",
        "onTap": () => pushScreen(context, MyQuotes()),
        "text": "Quotes"
      },
      {
        "images": "assets/picture.png",
        "onTap": () => pushScreen(context, MyImagesCB()),
        "text": "Images"
      },
      {
        "images": "assets/video.png",
        "onTap": () => pushScreen(context, MyVideosCB()),
        "text": "Video"
      },
      {
        "images": "assets/about.png",
        "onTap": () => pushScreen(context, AboutMe()),
        "text": "About"
      },
    ];
  }
}
