import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:flutter_shoes_app/models/shoe_model.dart';
import 'package:flutter_shoes_app/widgets/widgets.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shoe = ModalRoute.of(context)!.settings.arguments as ShoeModel;
    return Scaffold(
      appBar: CustomAppbar(shoe: shoe),
      body: Container(
        padding: const EdgeInsets.all(18),
        height: MediaQuery.of(context).size.height - 200,
        width: double.infinity,
        decoration: _detailContainer(),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              _TitleDescrip(shoe: shoe),
              const SizedBox(height: 10),
              const _Review(),
              const SizedBox(height: 20),
              const ColorsShoes(),
              const SizedBox(height: 20),
              const Sizes(),
              const SizedBox(height: 20),
              AddToCart(shoe: shoe),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _detailContainer() {
    return const BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFFf7366c), Color(0xFFff6f56), Color(0xFFfe9b46)],
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
      ),
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    );
  }
}

class _TitleDescrip extends StatelessWidget {
  const _TitleDescrip({Key? key, required this.shoe}) : super(key: key);

  final ShoeModel shoe;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          shoe.name,
          maxLines: 2,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline3,
        ),
        const SizedBox(height: 20),
        Text(
          shoe.description,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}

class _Review extends StatelessWidget {
  const _Review({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      delay: const Duration(milliseconds: 400),
      duration: const Duration(milliseconds: 800),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: List.generate(
              5,
              (index) =>
                  const Icon(Icons.star, color: Color(0xfff1c321), size: 30),
            ),
          ),
          const SizedBox(width: 10),
          Text('5.0 (2.325 views)',
              style: Theme.of(context).textTheme.subtitle1)
        ],
      ),
    );
  }
}
