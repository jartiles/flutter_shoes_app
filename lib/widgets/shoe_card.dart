import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_shoes_app/models/shoe_model.dart';
import 'package:flutter_shoes_app/providers/shoes_provider.dart';

class ShoeCard extends StatelessWidget {
  const ShoeCard({super.key, required this.shoe, this.fromArrivals = false});
  final ShoeModel shoe;
  final bool fromArrivals;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/detail', arguments: shoe),
      child: Container(
        width: fromArrivals ? 180 : 250,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: fromArrivals ? _arrivalBackground() : _gradientBackground(),
        child: Column(
          children: [
            _ShoePriceImage(shoe: shoe, fromArrivals: fromArrivals),
            _ShoeName(shoe: shoe, fromArrivals: fromArrivals)
          ],
        ),
      ),
    );
  }

  BoxDecoration _arrivalBackground() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: const Color(0xFFf7366c), width: 2),
    );
  }

  BoxDecoration _gradientBackground() {
    return BoxDecoration(
      gradient: const LinearGradient(
        colors: [Color(0xFFf7366c), Color(0xFFff6f56), Color(0xFFfe9b46)],
        begin: Alignment.centerLeft,
        end: Alignment.topRight,
      ),
      borderRadius: BorderRadius.circular(20),
    );
  }
}

class _ShoeName extends StatelessWidget {
  const _ShoeName({
    Key? key,
    required this.shoe,
    required this.fromArrivals,
  }) : super(key: key);
  final ShoeModel shoe;
  final bool fromArrivals;

  @override
  Widget build(BuildContext context) {
    final shoesProvider = Provider.of<ShoesProvider>(context);
    final category = shoesProvider.getCategory;
    return Expanded(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: shoeNameDecoration(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!fromArrivals)
                Text(
                  '$category\'s Shoes'.toUpperCase(),
                  style:
                      const TextStyle(color: Color(0xfff8a6ad), fontSize: 15),
                ),
              const SizedBox(height: 5),
              Text(
                shoe.name,
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
      ),
    );
  }

  BoxDecoration shoeNameDecoration() {
    return BoxDecoration(
      gradient: const LinearGradient(
        colors: [Color(0xFFe0586d), Color(0xFFf26a6e), Color(0xFFf07965)],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }
}

class _ShoePriceImage extends StatelessWidget {
  const _ShoePriceImage({
    Key? key,
    required this.shoe,
    required this.fromArrivals,
  }) : super(key: key);

  final ShoeModel shoe;
  final bool fromArrivals;

  @override
  Widget build(BuildContext context) {
    final shoesProvider = Provider.of<ShoesProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Stack(
        children: [
          if (!fromArrivals)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$ ${shoe.price}',
                  style: TextStyle(
                    color: fromArrivals ? Colors.black : Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Opacity(
                  opacity: 0.6,
                  child: Image(
                    image: AssetImage(shoesProvider.getBrandRoute),
                  ),
                )
              ],
            ),
          Hero(
            tag: '${shoe.id}-shoe-img',
            child: Image(
              image: NetworkImage(shoe.image),
              height: fromArrivals ? 180 : 250,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
