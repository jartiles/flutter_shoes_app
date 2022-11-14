import 'package:flutter/material.dart';

class Sizes extends StatelessWidget {
  const Sizes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Size',
          style: Theme.of(context).textTheme.headline4,
        ),
        const SizedBox(width: 40),
        Expanded(
          child: SizedBox(
            width: double.infinity,
            height: 30,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(9, (index) => _Size(index: index)),
            ),
          ),
        )
      ],
    );
  }
}

class _Size extends StatelessWidget {
  const _Size({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Text(
        '${index + 4}',
        style: const TextStyle(
          fontSize: 16,
          color: Color(0xFFff6f56),
        ),
      ),
    );
  }
}
