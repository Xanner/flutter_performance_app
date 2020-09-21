import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_1/animation_item.dart';

void main() {
  runApp(MyApp(
    items: List<String>.generate(1000, (i) => "Animacja #${i + 1}"),
  ));
}

class MyApp extends StatefulWidget {
  final List<String> items;

  MyApp({Key key, @required this.items}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  AnimationController animationController;

  final ScrollController scrollController = ScrollController();

  _scrollToBottom() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: Duration(seconds: 120), curve: Curves.linear);
  }

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 2),
    );

    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    final title = 'Test wydajności aplikacji Flutter';
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff6200EE),
          title: Text(title),
        ),
        body: ListView.builder(
          controller: scrollController,
          itemCount: widget.items.length,
          itemBuilder: (context, index) {
            return AnimationItem(
              animationController: animationController,
              items: widget.items,
              index: index,
            );
          },
        ),
      ),
    );
  }
}
