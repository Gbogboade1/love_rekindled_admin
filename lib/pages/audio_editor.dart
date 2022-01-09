import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jiffy/jiffy.dart';
import 'package:love_rekindled_admin/ui_items/custom_input.dart';
import 'package:love_rekindled_admin/ui_items/general_ui_item.dart';

class AudioEditorPage extends StatefulWidget {
  @override
  _AudioEditorPageState createState() => _AudioEditorPageState();
}

class _AudioEditorPageState extends State<AudioEditorPage> {
  TextEditingController titleEditingController;
  TextEditingController bodyEditingController;
  List<String> titles = [];
  String title = "";
  String body = "";

  File sampleImage;

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
        title: Text("Add Audio Series"),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: <Widget>[
          IgnorePointer(
            ignoring: isLoading,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: <Widget>[
                  ListView(
                    children: <Widget>[
                      chooseFileCard(),
                      SizedBox(height: 8),
                      CustomInputField(
                        topLabel: "Series Title",
                        hintText: "e.g. Faith is Now",
                        bottomLabel: "",
                        controller: titleEditingController,
                        fieldSubmitted: (text) {
                          setState(() {
                            title = text.toString();
                          });
                        },
                      ),
                      SizedBox(height: 8),
                      CustomInputField(
                        topLabel: "Price",
                        hintText: "",
                        bottomLabel: "",
                        fieldSubmitted: (text) {
                          setState(() {
                            body = text.toString();
                          });
                        },
                        keyboardType: TextInputType.number,
                        controller: bodyEditingController,
                      ),
                      SizedBox(height: 8),
                      Wrap(
                          children: List.generate(
                        10, //titles.length,
                        (index) => Card(
                          child: ListTile(
                            leading: Icon(
                              CupertinoIcons.music_note,
                            ),
                            title: Text("titles[index]"),
                            trailing: InkWell(
                              child: Icon(
                                CupertinoIcons.clear,
                                size: 32,
                              ),
                            ),
                          ),
                        ),
                      )),
                      verticalSpace(height: 16),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: InkWell(
                                  onTap: () {},
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Choose Audio file"),
                                    ),
                                  ),
                                ),
                              ),
                              verticalSpace(),
                              CustomInputField(
                                topLabel: "Track Title",
                                hintText: "",
                                bottomLabel: "",
                                fieldSubmitted: (text) {
                                  setState(() {
                                    body = text.toString();
                                  });
                                },
                                isMultiLine: true,
                                keyboardType: TextInputType.multiline,
                                controller: bodyEditingController,
                              ),
                              verticalSpace(),
                              CustomInputField(
                                topLabel: "Track Description",
                                hintText: "",
                                bottomLabel: "",
                                fieldSubmitted: (text) {
                                  setState(() {
                                    body = text.toString();
                                  });
                                },
                                isMultiLine: true,
                                keyboardType: TextInputType.multiline,
                                controller: bodyEditingController,
                              ),
                              verticalSpace(),
                              RaisedButton(
                                child: Text("Add Audio"),
                                onPressed: canUpload() ? () {} : null,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      RaisedButton(
                        child: Text("Upload"),
                        onPressed: canUpload() ? () {} : null,
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

  chooseFileCard() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: InkWell(
        onTap: () {
          getImage();
        },
        child: sampleImage == null
            ? Card(
                color: Colors.transparent,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(
                    child: Text(
                      "Tap to choose Cover photo",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            : Image.file(sampleImage, fit: BoxFit.fitHeight),
      ),
    );
  }

  Future getImage() async {
    var tempImage = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      sampleImage = tempImage;
    });
  }

  Future<String> uploadImage(var imageFile) async {
    var j = Jiffy().MMMMEEEEd;
    String imageName = "/ann$j.jpg";
  }
}
