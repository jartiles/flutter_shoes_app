import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

import 'package:flutter_shoes_app/models/shoe_model.dart';

import 'package:provider/provider.dart';
import 'package:flutter_shoes_app/providers/shoes_provider.dart';
import 'package:skeletons/skeletons.dart';

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
                        height: 100,
                        width: 250,
                        color: Colors.red,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                      ))
                    : _CategoryShoes(
                        shoe: shoesList[index],
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryShoes extends StatelessWidget {
  const _CategoryShoes({Key? key, required this.shoe}) : super(key: key);
  final ShoeModel shoe;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xfff6f6f6),
        border: Border.all(color: const Color(0xFFe53963), width: 3),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _ShoePrice(price: shoe.price),
            Image(
              //- Add 00 to nike
              image: NetworkImage(shoe.image),
              height: 220,
              width: double.infinity,
            ),
            Expanded(
              child: _ShoeFooter(name: shoe.name),
            )
          ],
        ),
      ),
    );
  }
}

class _ShoeFooter extends StatelessWidget {
  const _ShoeFooter({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    final shoesProvider = Provider.of<ShoesProvider>(context);
    final category = shoesProvider.getCategory;
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
        gradient: LinearGradient(
          colors: [Color(0xFFf74b79), Color(0xfff16369), Color(0xFFef7b62)],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$category\'s Shoes'.toUpperCase(),
              style: const TextStyle(color: Color(0xfff8a6ad), fontSize: 15),
            ),
            const SizedBox(height: 5),
            Text(
              name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _ShoePrice extends StatelessWidget {
  const _ShoePrice({Key? key, required this.price}) : super(key: key);
  final double price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 8.0),
      child: Text(
        '\$ $price',
        style: const TextStyle(
          color: Color(0xFFe53963),
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
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
          Text(
            title,
            style: title == category
                ? Theme.of(context).textTheme.headline5
                : Theme.of(context).textTheme.headline6,
          ),
          if (title == category)
            FadeInUp(
              duration: const Duration(milliseconds: 800),
              from: 20,
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
