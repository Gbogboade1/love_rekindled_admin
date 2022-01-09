import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jiffy/jiffy.dart';
import 'package:love_rekindled_admin/ui_items/custom_input.dart';

class BooksEditorPage extends StatefulWidget {
  @override
  _BooksEditorPageState createState() => _BooksEditorPageState();
}

class _BooksEditorPageState extends State<BooksEditorPage> {
  TextEditingController titleEditingController;
  TextEditingController bodyEditingController;

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
                      chooseFileCard(),
                      SizedBox(height: 8),
                      CustomInputField(
                        topLabel: "Book Title",
                        hintText: "e.g. Happy New Month",
                        bottomLabel: "This is the title of the book",
                        controller: titleEditingController,
                        fieldSubmitted: (text) {
                          setState(() {
                            title = text.toString();
                          });
                        },
                      ),
                      SizedBox(height: 8),
                      Wrap(
                        children: <Widget>[
                          CustomInputField(
                            topLabel: "Book Description",
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
                        ],
                      ),
                      SizedBox(height: 8),
                      Wrap(
                        children: <Widget>[
                          CustomInputField(
                            topLabel: "Price",
                            hintText:
                                "",
                            bottomLabel:
                                "",
                            fieldSubmitted: (text) {
                              setState(() {
                                body = text.toString();
                              });
                            },
                            keyboardType: TextInputType.number,
                            controller: bodyEditingController,
                          ),
                        ],
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
