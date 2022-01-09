
import 'package:love_rekindled_admin/model/church_item.dart';
import 'package:love_rekindled_admin/ui_items/goto_media_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideoViewPage extends StatefulWidget {
  final ChurchItem churchItem;

  const VideoViewPage({Key key, this.churchItem}) : super(key: key);

  @override
  _VideoViewPageState createState() => _VideoViewPageState();
}

class _VideoViewPageState extends State<VideoViewPage> {
  ChurchItem churchItem = ChurchItem();
  @override
  void initState() {
    super.initState();
    churchItem = widget.churchItem;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          widget.churchItem.title,
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          GotoMediaIcon(),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            buildMediaDisplayCard(),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    churchItem.title,
                    softWrap: true,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .apply(color: Colors.white),
                  ),
                  SizedBox(height: 8),
                  Text(
                    churchItem.subTitle,
                    softWrap: true,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .apply(color: Colors.white54, fontSizeFactor: 1.2),
                  ),
                  SizedBox(height: 8),
                  Text(
                    churchItem.date,
                    softWrap: true,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .apply(color: Colors.white38, fontSizeFactor: 1.1),
                  ),
                  SizedBox(height: 8),
                  Text(
                    churchItem.summaryText,
                    softWrap: true,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .apply(color: Colors.white38, fontSizeFactor: 1.1),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildButton(IconData icon, String text) {
    return Row(
      children: <Widget>[
        Card(
          color: Colors.white.withOpacity(.3),
          shape: CircleBorder(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              icon,
              size: 32,
              color: Colors.white,
            ),
          ),
        ),
        Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }

  buildMediaDisplayCard() {
    return Card(
      color: Colors.blue[800],
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .4,
        child: Stack(
          children: <Widget>[
            churchItem.imageUrl.isNotEmpty
                ? Center(
                    child: Image.asset(churchItem.imageUrl,
                        // alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height * .3),
                  )
                : SizedBox(),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Center(
                child: Card(
                  color: Colors.black,
                  shape: CircleBorder(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.play_arrow,
                      size: 52,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 8,
              left: 16,
              child: Card(
                color: Colors.black,
                shape: StadiumBorder(),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: <Widget>[
                      SizedBox(width: 4),
                      Icon(Icons.file_download, size: 16, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        "Download",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      SizedBox(width: 8),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
