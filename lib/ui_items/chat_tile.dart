
// import 'package:love_rekindled_admin/model/chat_model.dart';
// import 'package:flutter/material.dart';
// import 'package:love_rekindled_admin/pages/discussion/chat_page.dart';
// import 'package:love_rekindled_admin/ui_items/general_ui_item.dart';

// class ChatTile extends StatelessWidget {
//   final ChatModel chat;

//   const ChatTile({Key key, this.chat}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         pushRoute(
//             context,
//             ChatPage(
//               // name: chat.sender,
//               // imgurl: chat.imageUrl,
//             ));
//       },
//       child: Column(children: <Widget>[
//         ListTile(
//           leading: CircleAvatar(
//             backgroundImage: AssetImage(chat.imageUrl),
//             radius: 25.0,
//           ),
//           title: Text(chat.sender),
//           subtitle: Text(
//             chat.messageShort,
//             maxLines: 1,
//           ),
//           trailing: _buildTrailing(chat),
//           isThreeLine: false,
//         ),
//         Container(
//           height: .75,
//           width: double.infinity,
//           color: Colors.black26,
//           margin: EdgeInsets.only(left: 60.0),
//         )
//       ]),
//     );
//   }

//   Widget _buildTrailing(ChatModel chat) {
//     Widget unreadWidget;
//     if (chat.unreads == "") {
//       unreadWidget = Text("");
//     } else {
//       unreadWidget = CircleAvatar(
//         child: FittedBox(
//           child: Text(
//             chat.unreads,
//             style: TextStyle(fontSize: 10.0),
//           ),
//           fit: BoxFit.fill,
//         ),
//         backgroundColor: Colors.green,
//         maxRadius: 12.0,
//       );
//     }
//     return Column(
//       children: <Widget>[
//         Padding(
//           child: Text(
//             chat.time,
//             style: TextStyle(fontSize: 10.0),
//           ),
//           padding: EdgeInsets.only(bottom: 10.0),
//         ),
//         unreadWidget
//       ],
//     );
//   }
// }
