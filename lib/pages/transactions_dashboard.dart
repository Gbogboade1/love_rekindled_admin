import 'package:flutter/material.dart';
import 'package:love_rekindled_admin/style/styles.dart';
import 'package:love_rekindled_admin/ui_items/general_ui_item.dart';

class TransactionsDashboardPage extends StatefulWidget {
  @override
  _TransactionsDashboardPageState createState() =>
      _TransactionsDashboardPageState();
}

class _TransactionsDashboardPageState extends State<TransactionsDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Transactions"),
        backgroundColor: Colors.black,
      ),
      body: ListView(children: List.generate(10, (index) => buildListItem())),
    );
  }

  buildListItem() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.asset(
                  "images/img1.png",
                  width: 50,
                  height: 50,
                ),
                horizontalSpace(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("June 12, 2020", style: TextStyle(fontSize: 12, color: Colors.white),),
                    Text("Living the Life of Faith", style: Styles.normalBoldTextStyle,),
                  ],
                )
              ],
            ),
            Text(
              "Puchased by: Mr Tunji Olabodepeumin",
              style: Styles.normalTextStyle,
            ),
            Text(
              "Transaction Id: 5689ioij099jm9u0",
              style: Styles.normalTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
