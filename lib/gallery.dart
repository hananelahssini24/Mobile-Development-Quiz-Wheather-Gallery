import 'package:flutter/material.dart';

import 'gallery-data-page.dart';

class Gallery extends StatefulWidget {
  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  String keyWord = "";
  TextEditingController textEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(keyWord),
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: TextField(
              style: TextStyle(fontSize: 22),
              onChanged: (value) {
                setState(() {
                  this.keyWord = value;
                });
              },
              controller: textEditingController,
              decoration: InputDecoration(hintText: 'Tape your search'),
              onSubmitted: (value) {
                this.keyWord = value;
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => GalleryDataPage(this.keyWord)));
                textEditingController.text = "";
              },
            ),
            padding: EdgeInsets.all(10),
          ),
          Container(
              width: double.infinity,
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => GalleryDataPage(this.keyWord)));
                  textEditingController.text = "";
                },
                color: Colors.deepOrange,
                padding: EdgeInsets.all(10),
                child: Text(
                  "Get Images ",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
              ))
        ],
      ),
    );
  }
}
