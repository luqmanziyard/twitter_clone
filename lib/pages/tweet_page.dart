import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:twitter_clone/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:twitter_clone/widgets/rounded_button.dart';
import 'package:random_string/random_string.dart';
import 'package:twitter_clone/services/crud.dart';

class TweetPage extends StatefulWidget {
  static const id = 'tweet page';
  @override
  _TweetPageState createState() => _TweetPageState();
}

class _TweetPageState extends State<TweetPage> {
  String userName, caption;
  final ImagePicker _picker = ImagePicker();
  CrudMethods crudMethods = CrudMethods();
  File selectedImage;
  Future getImage() async {
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);

    try {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
    } catch (e) {
      print(e);
    }
  }

  uploadImage() async {
    //uploading an image to firebase
    if (selectedImage != null) {
      StorageReference firebaseStorageRef = FirebaseStorage.instance
          .ref()
          .child('tweetImage')
          .child('${randomAlphaNumeric(9)}.jpg');
      final StorageUploadTask task = firebaseStorageRef.putFile(selectedImage);
      var downloadUrl = await (await task.onComplete).ref.getDownloadURL();
      print('this is the $downloadUrl}');
      Map<String, String> blogMap = {
        'downloadUrl': downloadUrl,
        'caption': caption
      };
      crudMethods.addData(blogMap).then((value) {
        Navigator.pop(context);
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kDarkBlue,
      body: Column(
        children: <Widget>[
          //top bar
          Padding(
            padding: EdgeInsets.only(top: 30, right: 5, left: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: kLightBlue, fontSize: 16),
                  ),
                  padding: EdgeInsets.all(10),
                  minWidth: 0,
                  highlightColor: kDarkBlue,
                ),
                RoundedButton(
                  width: 60,
                  height: 32,
                  borderRadius: 20,
                  text: 'Tweet',
                  fonWeight: FontWeight.w700,
                  fontSize: 12,
                  onPressed: () {
                    uploadImage();
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          //profile icon and text field but gotta fix the row
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 10),
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: CircleAvatar(
                        radius: 19,
                        backgroundColor: kLightBlue,
                      ),
                      width: width * 0.1,
                      height: height,
                      alignment: Alignment.topRight,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      width: width * 0.7,
                      height: height,
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 250,
                            child: TextField(
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(10)
                              ],
                              autofocus: true,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              decoration: InputDecoration(
                                hintText: 'What\'s happening?',
                                hintStyle:
                                    TextStyle(color: kGrey, fontSize: 12),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: kDarkBlue,
                                  ),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: kDarkBlue,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          selectedImage != null
                              ? Container(
                                  height: 400,
                                  width: 250,
                                  child: Image.file(
                                    selectedImage,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //containers that pop
          selectedImage != null
              ? Container(
                  margin: EdgeInsets.only(bottom: 5),
                  padding: EdgeInsets.only(left: 10),
                  width: width,
                  height: 30,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.language,
                        color: kLightBlue,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Everyone can reply',
                        style: TextStyle(color: kLightBlue),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                )
              : Container(
                  height: 85,
                  color: Colors.transparent,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      UploadContainer(
                        child: Center(
                          child: Icon(
                            Icons.graphic_eq,
                            color: Colors.purple,
                          ),
                        ),
                      ),
                      UploadContainer(
                        child: Center(
                          child: Icon(
                            Icons.camera_alt,
                            color: kLightBlue,
                          ),
                        ),
                      ),
                      UploadContainer(),
                      UploadContainer(),
                      UploadContainer()
                    ],
                  ),
                ),
          Container(
            height: 46,
            width: width,
            decoration: BoxDecoration(
              color: kDarkBlue,
              border: Border(
                top: BorderSide(width: 0.5, color: kGrey),
              ),
            ),
            child: Row(
              children: <Widget>[
                MaterialButton(
                  onPressed: () {
                    getImage();
                  },
                  minWidth: 0,
                  padding: EdgeInsets.all(0),
                  child: Icon(
                    Icons.image,
                    color: kLightBlue,
                  ),
                ),
                MaterialButton(
                  onPressed: () {},
                  minWidth: 0,
                  padding: EdgeInsets.all(0),
                  child: Icon(
                    Icons.gif,
                    color: kLightBlue,
                  ),
                ),
                MaterialButton(
                  onPressed: () {},
                  minWidth: 0,
                  padding: EdgeInsets.all(0),
                  child: Icon(
                    Icons.poll,
                    color: kLightBlue,
                  ),
                ),
                MaterialButton(
                  onPressed: () {},
                  minWidth: 0,
                  padding: EdgeInsets.all(0),
                  child: Icon(
                    Icons.location_on,
                    color: kLightBlue,
                  ),
                ),
                SizedBox(
                  width: width * 0.35,
                ),
                Container(
                  width: 2,
                  height: 26,
                  color: kGrey.withOpacity(0.5),
                ),
                MaterialButton(
                  onPressed: () {},
                  minWidth: 0,
                  padding: EdgeInsets.all(0),
                  child: Icon(
                    Icons.add_circle,
                    color: kLightBlue,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class UploadContainer extends StatelessWidget {
  const UploadContainer({this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: 75,
      decoration: BoxDecoration(
        color: kDarkBlue,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        border: Border.all(
          color: kGrey,
          width: 0.5,
        ),
      ),
      margin: EdgeInsets.only(
        left: 10,
        bottom: 10,
      ),
      child: child,
    );
  }
}
