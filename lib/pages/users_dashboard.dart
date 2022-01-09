import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:love_rekindled_admin/style/styles.dart';
import 'package:love_rekindled_admin/ui_items/general_ui_item.dart';

class UsersDashboardPage extends StatefulWidget {
  @override
  _UsersDashboardPageState createState() => _UsersDashboardPageState();
}

class _UsersDashboardPageState extends State<UsersDashboardPage> {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: InkWell(
      //   onTap: () {
      //     // pushRoute(context, ConsellorsEditorPage());
      //   },
      //   child: Card(
      //     child: Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Wrap(
      //         alignment: WrapAlignment.center,
      //         crossAxisAlignment: WrapCrossAlignment.center,
      //         children: <Widget>[
      //           Icon(CupertinoIcons.add),
      //           Text("Add"),
      //           horizontalSpace(),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Users"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0,0,16,0),
        child: ListView(children: List.generate(10, (index) => buildListItem())),
      ),
    );
  }

  buildListItem() {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              child: Image.asset(
                "images/img1.png",
                width: 50,
                height: 50,
              ),
            ),
            horizontalSpace(),
            Expanded(
                child: Text(
              "Mr Tunji Olabodepeumin",
              style: Styles.normalTextStyle,
            ))
          ],
        ),
        Container(
          height: .7,
          color: Colors.white
        )
      ],
    );
  }
}
