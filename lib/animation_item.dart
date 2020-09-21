import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AnimationItem extends StatelessWidget {
  const AnimationItem({
    Key key,
    @required this.animationController,
    @required this.items,
    @required this.index,
  }) : super(key: key);

  final AnimationController animationController;
  final List<String> items;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 10),
        child: Row(
          children: [
            AnimatedBuilder(
              animation: animationController,
              child: const Image.asset("assets/images/avatar.PNG"),
              builder: (BuildContext context, Widget _widget) {
                return new Transform.rotate(
                  angle: animationController.value * 6.3,
                  child: _widget,
                );
              },
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 30, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      items[index],
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit." +
                          " Quisque sed posuere tortor.",
                      overflow: TextOverflow.clip,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
