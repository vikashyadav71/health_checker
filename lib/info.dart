import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

//void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Future<List<News>> _getValue() async {


    var url = await http.get(Uri.parse("http://newsapi.org/v2/top-headlines?country=in&category=health&apiKey=a2f4b35964b04aa98e840a6139d8efbf"));
    List<News> news = [];

    var jsonData = json.decode(url.body);
    var check = 0;
    Map map = jsonData;
    map.forEach((k, v) {
      if (k == "status" && v == "ok" || check == 1) {
        check = 1;
        if (k == "articles") {
          for (var x in v) {
            Map s = x;
            print(x["title"]);
            if (s["title"] != null &&
                s["url"] != null &&
                s["urlToImage"] != null &&
                s.containsKey("urlToImage") &&
                s.containsKey("url")) {
              if (s["author"] == null) {
                News n = News(s["urlToImage"], s["url"], s["title"], " ");
                news.add(n);
              } else {
                News n =
                News(s["urlToImage"], s["url"], s["title"], s["author"]);
                news.add(n);
              }
            }
          }
        }
      }
    });

    return news;
  }

  _launchURL(var link) async {
    var url = link;
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(backgroundColor: Colors.greenAccent,
            title: Text("News"),

          ),
          body: Container(
            child: FutureBuilder(
                future: _getValue(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return Container(
                      child: Center(
                          child: Text(
                            "Loading....",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                    );
                  } else {
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            padding: const EdgeInsets.all(16.0),
                            child: GestureDetector(
                              onTap: () {
                                _launchURL(snapshot.data[index].url);
                              },
                              child: Card(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Stack(
                                      children: <Widget>[
                                        Image.network(
                                            snapshot.data[index].urlToImage),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 180, left: 8),
                                          child: Text(
                                            snapshot.data[index].author,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Flexible(
                                          child: Container(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                snapshot.data[index].title,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'hpsimplified'),
                                              )),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  }
                }),
          )),
    );
  }
}

class News {
  final String urlToImage;
  final String url;
  final String title;
  final String author;

  News(this.urlToImage, this.url, this.title, this.author);
}
