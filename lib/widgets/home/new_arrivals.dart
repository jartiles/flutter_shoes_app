import 'package:flutter/material.dart';
import 'package:flutter_shoes_app/models/shoe_model.dart';
import 'package:provider/provider.dart';
import 'package:skeletons/skeletons.dart';

import 'package:flutter_shoes_app/providers/shoes_provider.dart';

class NewArrivals extends StatelessWidget {
  const NewArrivals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shoesProvider = Provider.of<ShoesProvider>(context);
    final arrivalsList = shoesProvider.newArrivals;
    final isLoading = shoesProvider.isLoading;

    return Container(
      height: 250,
      margin: const EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'New Arrivals',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: isLoading ? 10 : arrivalsList.length,
              itemBuilder: (context, index) {
                return isLoading
                    ? SkeletonItem(
                        child: Container(
                        width: 150,
                        color: Colors.red,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                      ))
                    : _Arrival(shoe: arrivalsList[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Arrival extends StatelessWidget {
  const _Arrival({Key? key, required this.shoe}) : super(key: key);
  final ShoeModel shoe;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: 150,
      decoration: BoxDecoration(
        color: const Color(0xfff6f6f6),
        border: Border.all(color: const Color(0xFFe53963), width: 3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Image(
            image: NetworkImage(shoe.image),
            height: 120,
            fit: BoxFit.contain,
          ),
          Expanded(
            child: Container(
              color: const Color(0xFFe53963),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: Text(
                shoe.name,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
