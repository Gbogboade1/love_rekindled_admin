
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:love_rekindled_admin/pages/audio/audio_player_page.dart';
import 'package:love_rekindled_admin/ui_items/general_ui_item.dart';

class GotoMediaIcon extends StatelessWidget {
  final Color color;

  const GotoMediaIcon({Key key, this.color = Colors.white}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // pushRoute(context, AudioPlayerPage());
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Icon(
          Icons.equalizer,
          color: color,
        ),
      ),
    );
  }
}
