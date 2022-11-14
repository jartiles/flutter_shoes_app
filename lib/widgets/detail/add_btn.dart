import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shoes_app/models/shoe_model.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({Key? key, required this.shoe}) : super(key: key);

  final ShoeModel shoe;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 70,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Price',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Text(
                  '\$${shoe.price}',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ],
            ),
            BounceInUp(
              from: 10,
              delay: const Duration(seconds: 1),
              child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'Add to cart',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ));
  }
}
