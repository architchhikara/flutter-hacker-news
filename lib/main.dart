import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:list_app/src/hn_bloc.dart';
import 'package:list_app/src/article.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  final hnbloc = HackerNewsBloc();
  runApp(MyApp(bloc: hnbloc));
}

class MyApp extends StatelessWidget {
  final HackerNewsBloc bloc;

  MyApp({
    Key key,
    this.bloc,
  }) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'List Page', bloc: bloc,),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final HackerNewsBloc bloc;

  MyHomePage({Key key, this.title, this.bloc}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: StreamBuilder<UnmodifiableListView<Article>>(
          stream: widget.bloc.articles ,
          initialData: UnmodifiableListView<Article>([]),
          builder: (context, snapshot) => ListView(
            children: snapshot.data.map(_buildItem).toList(),
          ) 
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
