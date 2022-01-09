
import 'package:love_rekindled_admin/style/styles.dart';
import 'package:love_rekindled_admin/model/body_item.dart';
import 'package:flutter/material.dart';
import 'package:love_rekindled_admin/ui_items/general_ui_item.dart';

class BodyItemTile extends StatelessWidget {
 final BodyItem item;

  const BodyItemTile({Key key, this.item}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        verticalSpace(),
        Row(
          children: <Widget>[
            horizontalSpace(),
            Card(
              color: item.color,
              shape: CircleBorder(),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Icon(
                  item.icon,
                  size: 32,
                  color: Colors.white,
                ),
              ),
            ),
            horizontalSpace(),
            Text(
              item.title,
              style: Styles.normalTextStyle,
            ),
          ],
        ),
        verticalSpace(height: 16),
        Container(
          height: 1,
          color: Colors.grey.withOpacity(.3),
        ),
        verticalSpace(),
      ],
    );
  }
}
