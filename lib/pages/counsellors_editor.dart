import 'package:flutter/material.dart';
import 'package:love_rekindled_admin/ui_items/custom_input.dart';
import 'package:love_rekindled_admin/ui_items/general_ui_item.dart';

class ConsellorsEditorPage extends StatefulWidget {
  @override
  _ConsellorsEditorPageState createState() => _ConsellorsEditorPageState();
}

class _ConsellorsEditorPageState extends State<ConsellorsEditorPage> {
 TextEditingController titleEditingController;
  TextEditingController bodyEditingController;

  String title = "";
  String body = "";


  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    titleEditingController = TextEditingController();
    bodyEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Book"),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: <Widget>[
          // AppBackground(),
          IgnorePointer(
            ignoring: isLoading,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: <Widget>[
                  ListView(
                    children: <Widget>[
                      verticalSpace(height: MediaQuery.of(context).size.height * .2),
                      CustomInputField(
                        topLabel: "Counsellor Email",
                        hintText:
                            "",
                        bottomLabel:
                            "",
                        fieldSubmitted: (text) {
                          setState(() {
                            body = text.toString();
                          });
                        },
                        isMultiLine: true,
                        keyboardType: TextInputType.multiline,
                        controller: bodyEditingController,
                      ),
                      SizedBox(height: 8),
                      RaisedButton(
                        child: Text("Upload"),
                        onPressed: canUpload()
                            ? () {
                              }
                            : null,
                      ),
                    ],
                  ),
                  isLoading
                      ? Container(
                          child: IgnorePointer(
                            ignoring: isLoading,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        )
                      : SizedBox(height: 0, width: 0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool canUpload() {
    if (titleEditingController.text.isEmpty) return false;
    if (bodyEditingController.text.isEmpty) return false;

    return true;
  }

  refreshState() {
    setState(() {});
  }

}
