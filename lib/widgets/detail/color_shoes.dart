import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class ColorsShoes extends StatelessWidget {
  const ColorsShoes({Key? key}) : super(key: key);

  static const List<Color> colors = [
    Color(0xFFff0f0d),
    Color(0xFF05fcff),
    Color(0xFF04ff01),
    Color(0xFF5468fa)
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Color',
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(width: 30),
        Row(
          children: List.generate(
            colors.length,
            (index) {
              return FadeInLeft(
                delay: Duration(milliseconds: index * 400),
                child: _Color(color: colors[index]),
              );
            },
          ),
        )
      ],
    );
  }
}

class _Color extends StatelessWidget {
  const _Color({Key? key, required this.color}) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: color,
      ),
    );
  }
}
