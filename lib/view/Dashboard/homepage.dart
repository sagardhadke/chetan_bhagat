import 'package:chetan_bhagat/view/exports/myexports.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chetan Bhagat"),
        backgroundColor: Colors.amber,
      ),
      backgroundColor: Color(0xFFF2F2F2),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 3.5,
            width: double.infinity,
            child: Card(
              color: Colors.white,
              elevation: 5,
              shadowColor: Colors.grey,
              child: Column(
                children: [
                  Image.asset(
                      height: MediaQuery.sizeOf(context).height / 4.5,
                      width: 150,
                      "assets/chetan_bhagat_031.png"),
                  Text(
                    "Chetan Bhagat",
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),

          // Row(
          //   children: [
          //     Uihelper.customContainer(
          //         context: context,
          //         callback: () {},
          //         imgUrl: "assets/chetan_bhagat_031.png",
          //         text: "Books"),
          //     Uihelper.customContainer(
          //         context: context,
          //         callback: () {},
          //         imgUrl: "assets/chetan_bhagat_031.png",
          //         text: "Motivational Stories"),
          //   ],
          // ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView(
                shrinkWrap: true,
                // physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 5),
                children: [
                  for (int i = 0;
                      i < Uihelper.dashboardData(context).length;
                      i++) ...{
                    Uihelper.customContainer(
                        callback: () {
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //     SnackBar(content: Text("item onPress")));

                          Uihelper.dashboardData(context)[i]["onTap"]();
                        },
                        text: Uihelper.dashboardData(context)[i]["text"],
                        imgUrl: Uihelper.dashboardData(context)[i]["images"],
                        context: context)
                  }
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
