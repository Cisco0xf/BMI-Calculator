import 'package:flutter/material.dart';

class RulerWidget extends StatelessWidget {
  const RulerWidget({super.key});

  Widget _lineItem({double height = 18.0}) {
    return Container(
      width: 2,
      height: height,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          for (int i = 0; i < 22; i++) ...{
            _lineItem(height: i == 14 ? 30 : 18),
          },
        ],
      ),
    );
  }
}
