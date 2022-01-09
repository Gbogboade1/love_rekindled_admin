import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:love_rekindled_admin/pages/counsellors_editor.dart';
import 'package:love_rekindled_admin/style/styles.dart';
import 'package:love_rekindled_admin/ui_items/general_ui_item.dart';

class CounsellorsDashboardPage extends StatefulWidget {
  @override
  _CounsellorsDashboardPageState createState() =>
      _CounsellorsDashboardPageState();
}

class _CounsellorsDashboardPageState extends State<CounsellorsDashboardPage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () {
          // pushRoute(context, ConsellorsEditorPage());
          buildDialogue();
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
        title: Text("Counsellors"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0, 16, 0),
        child:
            ListView(children: List.generate(10, (index) => buildListItem())),
      ),
    );
  }

  buildDialogue() {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          titlePadding:EdgeInsets.all(16),
          contentPadding: EdgeInsets.all(16),
          title: Text("Enter Phone number"),
          // titlePadding: -8,
          children: <Widget>[
            TextField(
              controller: controller,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(hintText: "090123456889"),
            ),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  
                });
              },
              child: Text("Proceed"),
            )
          ],
        );
      },
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
          height: .5,
          color: Colors.white,
        )
      ],
    );
  }
}
