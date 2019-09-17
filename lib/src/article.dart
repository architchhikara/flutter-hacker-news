import 'dart:convert' as json;
import 'package:built_value/built_value.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'serializers.dart';

part 'article.g.dart';

abstract class Article implements Built<Article, ArticleBuilder> {
  static Serializer<Article> get serializer => _$articleSerializer;

  int get id;

  @nullable
  bool get deleted;

  /// This is a type of Article
  /// 
  /// This can be of types : "job", "story", "comment", "poll", or "pollopt".
  String get type; 
  String get by;
  int get time;

  @nullable 
  String get text;

  @nullable 
  bool get dead;

  @nullable
  int get parent;

  @nullable 
  int get poll;

  BuiltList<int> get kids;

  @nullable 
  String get url;

  @nullable 
  int get score;

  @nullable 
  String get title;

  BuiltList<int> get parts;

  @nullable 
  int get descendants;

  Article._();
  factory Article([updates(ArticleBuilder b)]) = _$Article;
}

List<int> parseTopStories(String jsonStr) {
  final parsed = json.jsonDecode(jsonStr);
  final listofIds = List<int>.from(parsed);
  return listofIds;
}

Article parseArticle(String jsonStr) {
  final parsed = json.jsonDecode(jsonStr);
  Article article = standardSerializers.deserializeWith(Article.serializer, parsed);
  return article;
}