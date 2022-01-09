import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:love_rekindled_admin/pages/audio_dashboard.dart';
import 'package:love_rekindled_admin/pages/banners_editor.dart';
import 'package:love_rekindled_admin/pages/books_dashboard.dart';
import 'package:love_rekindled_admin/pages/counsellors_dashboard.dart';
import 'package:love_rekindled_admin/pages/settings_page.dart';
import 'package:love_rekindled_admin/pages/transactions_dashboard.dart';
import 'package:love_rekindled_admin/pages/users_dashboard.dart';
import 'package:love_rekindled_admin/pages/videos_dashboard.dart';
import 'package:love_rekindled_admin/ui_items/general_ui_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<HomeItem> itemList = [
    HomeItem(
      icons: CupertinoIcons.book_solid,
      title: "Books",
      page: BooksDashboardPage(),
    ),
    HomeItem(
      icons: CupertinoIcons.double_music_note,
      title: "Audio",
      page: AudioDashboardPage(),
    ),
    HomeItem(
      icons: CupertinoIcons.video_camera_solid,
      title: "Videos",
      page: VideoDashboardPage(),
    ),
    HomeItem(
      icons: CupertinoIcons.news_solid,
      title: "Banners",
      page: BannersEditorPage(),
    ),
    HomeItem(
      icons: CupertinoIcons.person_solid,
      title: "Users",
      page: UsersDashboardPage(),
    ),
    HomeItem(
      icons: CupertinoIcons.profile_circled,
      title: "Counsellors",
      page: CounsellorsDashboardPage(),
    ),
    HomeItem(
      icons: CupertinoIcons.mail_solid,
      title: "Transaction",
      page: TransactionsDashboardPage(),
    ),
    HomeItem(
      icons: CupertinoIcons.settings_solid,
      title: "Settings",
      page: SettingsPage(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Dashboard"),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            bottom: 36,
            left: 0,
            right: 0,
            child: GridView(
              // shrinkWrap: true,
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.all(8.0),
              physics: const BouncingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                childAspectRatio: 2 / 3,
              ),
              children: List.generate(
                itemList.length,
                (index) {
                  HomeItem item = itemList[index];
                  return InkWell(
                    onTap: () {
                      pushRoute(context, item.page);
                    },
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            item.icons,
                            size: 64,
                          ),
                          verticalSpace(),
                          Text(item.title)
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            child: Center(
                child: Text(
              "Love Rekindled",
              style: TextStyle(
                fontSize: 32,
                color: Colors.white),
            )),
            bottom: 0,
            left: 0,
            right: 0,
          )
        ],
      ),
    );
  }
}

class HomeItem {
  final IconData icons;
  final String title;
  final Widget page;

  HomeItem({
    @required this.icons,
    @required this.title,
    @required this.page,
  });
}
