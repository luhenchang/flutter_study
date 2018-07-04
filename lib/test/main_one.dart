import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  //Stateless widgets 是不可变的，这意味着它们的属性不能改变——所有的值都是 final。
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        /*appBar: new AppBar(
          title: const Text("Flutter Demon"),
        ),
        body: new Center(
          //当子类是变量时候，那么父类就必须是变量了所以要new替换成const他所在的父类应该都是new,包括同级控件哦。但是他的同级兄弟常量儿子可以是常量const
          child: new RandomWords(),
        ),*/
       body: new RandomWords(),
      ),
    );
  }
}

// stateful widget（有状态的控件）
class RandomWords extends StatefulWidget {
//  创建自己的状态类 —— RandomWordsState
  @override
  RandomWordsState createState() => new RandomWordsState();
}

//State 类在 widget 生命周期中始终存在。
class RandomWordsState extends State<RandomWords> {
  /*
  //文本测试1.0
  @override
  Widget build(BuildContext context) {
    final WordPair wordPair = new WordPair.random();
    return new Text(wordPair.asPascalCase);

  }*/
  final List<WordPair> _suggestions = <WordPair>[];
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
          title: new Text("很两居室里见鬼了萨加福禄寿"),
        ),
        body:_buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),

        // 对于每个建议的单词对都会调用一次 itemBuilder，
        // 然后将单词对添加到 ListTile 行中
        // 在偶数行，该函数会为单词对添加一个 ListTile row.
        // 在奇数行，该行书湖添加一个分割线 widget，来分隔相邻的词对。
        // 注意，在小屏幕上，分割线看起来可能比较吃力。

        itemBuilder: (BuildContext _context, int i) {
          // 在每一列之前，添加一个1像素高的分隔线widget
          if (i.isOdd) {
            return new Divider();
          }

          // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整）
          // 比如 i 为：1, 2, 3, 4, 5 时，结果为 0, 1, 1, 2, 2，
          // 这可以计算出 ListView 中减去分隔线后的实际单词对数量
          final int index = i ~/ 2;
          // 如果是建议列表中最后一个单词对
          if (index >= _suggestions.length) {
            // ...接着再生成10个单词对，然后添加到建议列表
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}
