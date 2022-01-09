
import 'package:flutter/material.dart';
import 'package:love_rekindled_admin/model/church_item.dart';
import 'package:love_rekindled_admin/pages/video_view_page.dart';

class VideoSinglePage extends StatefulWidget {
  final int bodyIndex;

  const VideoSinglePage({Key key, this.bodyIndex}) : super(key: key);
  @override
  _VideoSinglePageState createState() => _VideoSinglePageState();
}

class _VideoSinglePageState extends State<VideoSinglePage> {
  final GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    getList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Video"),
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
                      child: Center(child: Text("No data found")));
                } else {
                  List<ChurchItem> churchItemList = snapshot.data;
                  return ListView(
                    // shrinkWrap: true,
                    children: List<Widget>.generate(
                      churchItemList.length,
                      (index) {
                        ChurchItem item = churchItemList[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (c) => VideoViewPage(
                                          churchItem: item,
                                        )));
                          },
                          child: AnimatedContainer(
                            duration: Duration(seconds: 2),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(8.0, 0, 8, 8),
                              child: Wrap(
                                // direction: Axis.vertical,
                                children: <Widget>[
                                  Image.asset(
                                    item.imageUrl,
                                    width: double.infinity,
                                    height: 200,
                                    fit: BoxFit.fill,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 8, bottom: 32),
                                    child: Text(item.title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            .apply(color: Colors.white)),
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
      title:
          "${widget.bodyIndex}Leadership RoundTable Through rhe COVID-19 Crisis",
      subTitle: "Josh Patterson, Matt Chandler, and Summer Vision-Berger",
      date: "June 10, 2020",
      isDownloaded: false,
      videoUrl: "url",
      audioUrl: "url",
      summaryText:
          "In thi new (Virtual) Leadership Roundtable, Josh Patterson, Matt Chandler, and Summer Vision talks about how they are navigated the COVID 19 crisis as laders in the love_rekindled_admin.",
    );

    for (var i = 0; i < 15; i++) {
      await Future.delayed(Duration(milliseconds: 600));
      churchItemList.add(c);
      yield churchItemList;
    }
    churchItemList = List.generate(20, (i) => c);
  }
}
