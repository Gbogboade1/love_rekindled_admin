import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BannersEditorPage extends StatefulWidget {
  @override
  _BannersEditorPageState createState() => _BannersEditorPageState();
}

class _BannersEditorPageState extends State<BannersEditorPage> {
  TextEditingController urlEdittingController;
  bool isLoading = false;
  bool isFetching = false;
  String youtubeUrl = "";
  File sampleImage;
  List<String> imageUrlList = [
    "images/img1.png",
    "images/img1.jpg",
    "images/img1.png",
  ];

  getImageUrl() async {}

  updateList() {}

  uploadYoutubeUrl() async {}

  Future<String> uploadImage(var imageFile) async {}

  uploadStepperUrl() async {}

  Future getImage() async {
    var tempImage = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      sampleImage = tempImage;
    });
  }

  @override
  void initState() {
    super.initState();
    urlEdittingController = TextEditingController();
    getImageUrl();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getImage();
        },
        child: Icon(Icons.add_a_photo),
      ),
      appBar:
          AppBar(backgroundColor: Colors.black, title: Text("Edit Home Page")),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              children: <Widget>[
                ListView(
                  children: <Widget>[
                    Center(
                        child:
                            Text("Total images found: ${imageUrlList.length}")),
                    Wrap(
                      children: List.generate(
                        imageUrlList.length,
                        (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            children: <Widget>[
                              Image.asset(
                                imageUrlList[index],
                                height: 150,
                                width: double.infinity,
                              ),
                              Positioned(
                                  top: 8,
                                  right: 8,
                                  child: Card(
                                    color: Colors.red,
                                    child: IconButton(
                                        color: Colors.white,
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            imageUrlList
                                                .remove(imageUrlList[index]);
                                          });
                                        }),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height * 0.2,
                    //   child: InkWell(
                    //     onTap: () {
                    //       getImage();
                    //     },
                    //     child: sampleImage == null
                    //         ? Card(
                    //             color: Colors.transparent,
                    //             child: Padding(
                    //               padding: EdgeInsets.all(16),
                    //               child: Column(
                    //                 mainAxisAlignment:
                    //                     MainAxisAlignment.spaceBetween,
                    //                 children: <Widget>[
                    //                   Text(
                    //                     "Tap to choose file",
                    //                     textAlign: TextAlign.center,
                    //                   ),
                    //                 ],
                    //               ),
                    //             ),
                    //           )
                    //         : Image.file(sampleImage, fit: BoxFit.fitHeight),
                    //   ),
                    // ),
                    // SizedBox(height: 8.0),
                    // Align(
                    //   alignment: Alignment.centerRight,
                    //   child: RaisedButton(
                    //     child: Text("Upload"),
                    //     onPressed: sampleImage == null
                    //         ? null
                    //         : () {
                    //             uploadStepperUrl();
                    //           },
                    //   ),
                    // ),
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
        ],
      ),
    );
  }

  buildDialogue() {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          contentPadding: EdgeInsets.all(8),
          title: Text("Enter Counsellor email"),
          // titlePadding: -8,
          children: <Widget>[],
        );
      },
    );
  }
}
