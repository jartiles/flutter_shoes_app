import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletons/skeletons.dart';

import 'package:flutter_shoes_app/providers/shoes_provider.dart';
import 'package:flutter_shoes_app/widgets/shoe_card.dart';

class NewArrivals extends StatelessWidget {
  const NewArrivals({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shoesProvider = Provider.of<ShoesProvider>(context);
    final arrivalsList = shoesProvider.newArrivals;
    final isLoading = shoesProvider.isLoadingArrivals;

    return Container(
      height: 300,
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
                    : ShoeCard(shoe: arrivalsList[index], fromArrivals: true);
              },
            ),
          ),
        ],
      ),
    );
  }
}
