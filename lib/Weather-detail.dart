import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WeatherDetail extends StatefulWidget {
  String city = "casablanca";
  WeatherDetail(this.city);

  @override
  State<WeatherDetail> createState() => _WeatherDetailState();
}

class _WeatherDetailState extends State<WeatherDetail> {
  var weatgerData;
  @override
  void initState() {
    super.initState();
    getData(widget.city);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Weather of city ${widget.city}'),
          backgroundColor: Colors.deepOrange,
        ),
        body: (weatgerData == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount:
                    (weatgerData == null ? 0 : weatgerData['list'].length),
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.deepOrange,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              CircleAvatar(
                                backgroundImage: AssetImage(
                                    "images/${weatgerData['list'][index]['weather'][0]['main'].toString().toLowerCase()}.png"),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "${new DateFormat('E-dd/MM/yyyy').format(DateTime.fromMicrosecondsSinceEpoch(weatgerData['list'][index]['dt'] * 1000000))}",
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "${new DateFormat('HH:mm').format(DateTime.fromMicrosecondsSinceEpoch(weatgerData['list'][index]['dt'] * 1000000))} | ${weatgerData['list'][index]['weather'][0]['main']}",
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "${weatgerData['list'][index]['main']['temp'].round()} C°",
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  );
                })));
  }

  getData(String city) {
    String url =
        "https://api.openweathermap.org/data/2.5/forecast?q=${city}&appid=162a4610a75291cd2bbe1446cd5f82b1&units=metric";
    http.get(Uri.parse(url)).then((resp) {
      setState(() {
        this.weatgerData = jsonDecode(resp.body);
        print(this.weatgerData);
      });
    }).catchError((onError) {
      print(onError);
    });
  }
}
