
import 'package:love_rekindled_admin/pages/podcast_view_page.dart';
import 'package:love_rekindled_admin/style/styles.dart';
import 'package:love_rekindled_admin/model/church_item.dart';
import 'package:flutter/material.dart';
import 'package:love_rekindled_admin/ui_items/general_ui_item.dart';

class AudioSinglePage extends StatefulWidget {
  final String title;

  const AudioSinglePage({Key key, this.title}) : super(key: key);
  @override
  _AudioSinglePageState createState() => _AudioSinglePageState();
}

class _AudioSinglePageState extends State<AudioSinglePage> {
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
        title: Text(widget.title),
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
                    children: <Widget>[
                      Image.asset("images/img1.jpg"),
                      verticalSpace(),
                      Wrap (
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
                                        builder: (c) => PodcastViewPage(
                                              churchItem: item,
                                            )));
                              },
                              child: AnimatedContainer(
                                duration: Duration(seconds: 2),
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          8.0, 0, 8, 8),
                                      child: Row(
                                        // direction: Axis.vertical,
                                        children: <Widget>[
                                          Image.asset(
                                            item.imageUrl,
                                            width: 64,
                                            height: 64,
                                            // fit: BoxFit.fill,
                                          ),
                                          horizontalSpace(),
                                          Expanded(
                                            child: Text(item.title,
                                                softWrap: true,
                                                style:
                                                    Styles.normalBoldTextStyle),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: .75,
                                      color: Colors.grey,
                                    ),
                                    verticalSpace(),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
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
