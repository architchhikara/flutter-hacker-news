import 'dart:async';
import 'dart:collection';

import 'package:list_app/src/article.dart';
import 'package:rxdart/subjects.dart';
import 'package:http/http.dart' as http;

class HackerNewsBloc {

  final _articlesSubject = BehaviorSubject<UnmodifiableListView<Article>>();

  var _articles = <Article>[];

  List<int> _ids = [
    20955103,
    20970774,
    20965771,
    20965386,
    20978055,
    20965800,
    20966027
  ];

  HackerNewsBloc(){
    updateArticles().then((_) {
      _articlesSubject.add(UnmodifiableListView(_articles));
    });
  }

    Stream<UnmodifiableListView<Article>> get articles => _articlesSubject.stream;

  Future<Article> _getArticle(int id) async{
    final storyUrl = "https://hacker-news.firebaseio.com/v0/item/$id.json";
    final storyRes = await http.get(storyUrl);
    if (storyRes.statusCode == 200) {
      return parseArticle(storyRes.body);
    }
  }

  Future<Null> updateArticles() async {
    final futureArticles = _ids.map((id) => _getArticle(id));
    final articles = await Future.wait(futureArticles);
    _articles = articles;
  }

}