import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:love_rekindled_admin/model/church_item.dart';
import 'package:love_rekindled_admin/pages/audio_editor.dart';
import 'package:love_rekindled_admin/pages/video_single_page.dart';
import 'package:love_rekindled_admin/pages/videos_editor.dart';
import 'package:love_rekindled_admin/ui_items/general_ui_item.dart';

class VideoDashboardPage extends StatefulWidget {
  @override
  _VideoDashboardPageState createState() => _VideoDashboardPageState();
}

class _VideoDashboardPageState extends State<VideoDashboardPage> {
  final GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () {
          pushRoute(context, VideoEditorPage());
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: <Widget>[
                Icon(CupertinoIcons.add),
                Text("Add"),
                horizontalSpace(),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Videos"),
        backgroundColor: Colors.black,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
          await Future.delayed(Duration(seconds: 3));
          getList();
        },
        child: StreamBuilder<List<ChurchItem>>(
            stream: getList(),
            key: _key,
            initialData: null,
            builder: (context, snapshot) {
              if (snapshot == null) {
                return Card(child: Center(child: Text("Unable to fetch data")));
              } else {
                if (snapshot.data == null) {
                  return Card(
                    color: Colors.grey.withOpacity(.1),
                    child: Center(
                        child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    )),
                  );
                } else {
                  List<ChurchItem> churchItemList = snapshot.data;
                  return ListView(
                    children: List<Widget>.generate(
                      churchItemList.length,
                      (index) {
                        ChurchItem item = churchItemList[index];
                        // print("${item.date}");
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (c) => VideoSinglePage(
                                  bodyIndex: 12,
                                ),
                              ),
                            );
                          },
                          child: AnimatedContainer(
                            duration: Duration(seconds: 2),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  Image.asset(item.imageUrl,
                                      fit: BoxFit.fitWidth,
                                      alignment: Alignment.center,
                                      height:
                                          200 //MediaQuery.of(context).size.height * 3,
                                      ),
                                  SizedBox(height: 4),
                                  Text(
                                    item.title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        .apply(
                                            fontSizeFactor: .7,
                                            color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              }
            }),
      ),
    );
  }

  Stream<List<ChurchItem>> getList() async* {
    List<ChurchItem> churchItemList = [];
    ChurchItem c = ChurchItem(
      imageUrl: "images/img1.jpg",
      title: "Leadership RoundTable Through rhe COVID-19 Crisis",
      subTitle: "Josh Patterson, Matt Chandler, and Summer Vision-Berger",
      date: "June 10, 2020",
      isDownloaded: false,
      videoUrl: "url",
      audioUrl: "url",
      summaryText:
          "In thi new (Virtual) Leadership Roundtable, Josh Patterson, Matt Chandler, and Summer Vision talks about how they are navigated the COVID 19 crisis as laders in the love_rekindled.",
    );

    for (var i = 0; i < 15; i++) {
      await Future.delayed(Duration(milliseconds: 600));
      churchItemList.add(c);
      yield churchItemList;
    }
    churchItemList = List.generate(20, (i) => c);
  }
}
