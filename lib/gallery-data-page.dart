import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GalleryDataPage extends StatefulWidget {
  String keyWord = "";
  GalleryDataPage(this.keyWord);

  @override
  State<GalleryDataPage> createState() => _GalleryDataPageState();
}

class _GalleryDataPageState extends State<GalleryDataPage> {
  int currentPage = 1;
  int pageSize = 10;
  int totalPages = 0;
  ScrollController _scrollController = new ScrollController();
  dynamic dataGallery;
  List<dynamic> hits = [];
  @override
  void initState() {
    super.initState();
    this.getData();
    this._scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        if (currentPage < totalPages) {
          ++currentPage;
          this.getData();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.keyWord},Page ${currentPage}/${totalPages}"),
          backgroundColor: Colors.deepOrange,
        ),
        body: (dataGallery == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: (dataGallery == null ? 0 : hits.length),
                controller: _scrollController,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Center(
                              child: Text(
                                hits[index]['tags'],
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          color: Colors.deepOrange,
                        ),
                      ),
                      Container(
                        child: Card(
                          child: Image.network(
                            hits[index]['webformatURL'],
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        padding: EdgeInsets.only(left: 10, right: 10),
                      )
                    ],
                  );
                })));
  }

  getData() {
    String url =
        "https://pixabay.com/api/?key=44777910-9c201689a6993263edb2b7bb8&q=${widget.keyWord}&page=$currentPage&per_page=$pageSize";
    http.get(Uri.parse(url)).then((resp) {
      setState(() {
        dataGallery = json.decode(resp.body);
        hits.addAll(dataGallery['hits']);
        if (dataGallery['totalHits'] % this.pageSize == 0)
          this.totalPages = dataGallery['totalHits'] ~/ this.pageSize;
        else
          this.totalPages =
              1 + (dataGallery['totalHits'] / this.pageSize).floor() as int;
        print(hits);
      });
    }).catchError((onError) {
      print(onError);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }
}
