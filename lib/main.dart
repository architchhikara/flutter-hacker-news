import 'dart:async';

import 'package:flutter/material.dart';
import 'src/article.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'List Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> _ids = [
    20955103,
    20970774,
    20965771,
    20965386,
    20978055,
    20965800,
    20966027
  ];

  Future<Article> _getArticle(int id) async{
    final storyUrl = "https://hacker-news.firebaseio.com/v0/item/$id.json";
    final storyRes = await http.get(storyUrl);
    if (storyRes.statusCode == 200) {
      return parseArticle(storyRes.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
            children: _ids.map((i) => 
            FutureBuilder<Article>(
                future: _getArticle(i),
                builder: (BuildContext context, AsyncSnapshot<Article> snapshot){
                  if(snapshot.connectionState == ConnectionState.done){
                    return _buildItem(snapshot.data);
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
            )
            ).toList(),
          ),
        );
  }

  Widget _buildItem(Article article) {
    return Padding(
      key: Key(article.title),
      padding: const EdgeInsets.all(16.0),
      child: ExpansionTile(
        title: Text(article.title ?? '[null]' , style: TextStyle(fontSize: 30.0)),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(article.type),
              MaterialButton(
                color: Colors.lightBlueAccent,
                onPressed: () async {
                  final url = "https://${article.url}";
                  if (await canLaunch(article.url)) {
                    launch(article.url);
                  }
                },
                child: Text("Open"),
              )
            ],
          )
        ],
        // onTap: () async {
        //   final url = "https://${article.domain}";
        //   if (await canLaunch(url)) {
        //     launch(url);
        //   }
        // },
      ),
    );
  }
}
