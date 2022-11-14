import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:provider/provider.dart';
import 'package:skeletons/skeletons.dart';

import 'package:flutter_shoes_app/widgets/widgets.dart';
import 'package:flutter_shoes_app/providers/shoes_provider.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shoesProvider = Provider.of<ShoesProvider>(context);
    final shoesList = shoesProvider.shoesList;
    final isLoading = shoesProvider.isLoading;

    return SizedBox(
      height: 350,
      child: Row(
        children: [
          SizedBox(
            width: 50,
            child: RotatedBox(
              quarterTurns: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  _Category(title: 'Men'),
                  _Category(title: 'Women'),
                  _Category(title: 'Kids')
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: isLoading ? 10 : shoesList.length,
              itemBuilder: (context, index) {
                return isLoading
                    ? SkeletonItem(
                        child: Container(
                        width: 250,
                        color: Colors.red,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                      ))
                    : ShoeCard(shoe: shoesList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Category extends StatelessWidget {
  const _Category({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final shoesProvider = Provider.of<ShoesProvider>(context);
    final category = shoesProvider.getCategory;
    return GestureDetector(
      onTap: () => shoesProvider.setCategory = title,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeIn(
            duration: const Duration(milliseconds: 600),
            child: Text(
              title,
              style: title == category
                  ? Theme.of(context).textTheme.headline5
                  : Theme.of(context).textTheme.headline6,
            ),
          ),
          if (title == category)
            FadeInUp(
              duration: const Duration(milliseconds: 800),
              from: 5,
              child: Container(
                height: 8,
                width: 8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.black,
                ),
              ),
            )
        ],
      ),
    );
  }
}
