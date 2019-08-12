import 'package:flutter/cupertino.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'RandomWords.dart';

class RandomWordsState extends State<RandomWords> {
  //以下划线（_）开头，在Dart语言中使用下划线前缀标识符，会强制其变成私有的
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _save = new Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    final wordTxt = new WordPair.random();

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("RandomWordsState Scaffold title"),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      final tiles = _save.map((pair) {
        return new ListTile(
          title: new Text(
            pair.asPascalCase,
            style: _biggerFont,
          ),
        );
      });

      final divider = ListTile.divideTiles(
        context: context,
        tiles: tiles,
      ).toList();

      return new Scaffold(
        appBar: new AppBar(
          title: new Text("Saved Suggestions"),
        ),
        body: new ListView(
          children: divider,
        ),
      );
    }));
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return new Divider();
          // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整），比如i为：1, 2, 3, 4, 5
          // 时，结果为0, 1, 1, 2, 2， 这可以计算出ListView中减去分隔线后的实际单词对数量
          final index = i ~/ 2;

          if (index >= _suggestions.length) {
            // ...接着再生成10个单词对，然后添加到建议列表
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair wordPair) {
    final alreadySaved = _save.contains(wordPair);

    return new ListTile(
        title: new Text(
          wordPair.asPascalCase,
          style: _biggerFont,
        ),
        trailing: new Icon(
            alreadySaved ? Icons.favorite : Icons.favorite_border,
            color: alreadySaved ? Colors.red : null),
        onTap: () {
          setState(() {
            if (alreadySaved) {
              _save.remove(wordPair);
            } else {
              _save.add(wordPair);
            }
          });
        });
  }
}
