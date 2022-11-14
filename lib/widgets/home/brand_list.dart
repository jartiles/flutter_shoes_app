import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animate_do/animate_do.dart';

import 'package:flutter_shoes_app/providers/shoes_provider.dart';

class Brand {
  Brand({required this.brandName, required this.brandImageRoute});

  final String brandName;
  final String brandImageRoute;
}

class BrandList extends StatelessWidget {
  const BrandList({Key? key}) : super(key: key);

  static final List<Brand> brands = [
    Brand(brandName: 'Nike', brandImageRoute: 'assets/nike.png'),
    Brand(brandName: 'Adidas', brandImageRoute: 'assets/adidas.png'),
    Brand(brandName: 'Puma', brandImageRoute: 'assets/puma.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: brands.length,
        itemBuilder: (context, index) => _BrandItem(brand: brands[index]),
      ),
    );
  }
}

class _BrandItem extends StatelessWidget {
  const _BrandItem({Key? key, required this.brand}) : super(key: key);
  final Brand brand;

  @override
  Widget build(BuildContext context) {
    final brandSelected = Provider.of<ShoesProvider>(context).getBrand;

    return brandSelected == brand.brandName
        ? SlideInLeft(
            from: 10,
            child: _SelectedBrand(brand: brand),
          )
        : _UnselectedBrand(brand: brand);
  }
}

class _UnselectedBrand extends StatelessWidget {
  const _UnselectedBrand({Key? key, required this.brand}) : super(key: key);

  final Brand brand;

  @override
  Widget build(BuildContext context) {
    final shoesProvider = Provider.of<ShoesProvider>(context);
    return GestureDetector(
      onTap: () {
        shoesProvider.setBrand = brand.brandName;
        shoesProvider.setBrandRoute = brand.brandImageRoute;
      },
      child: Container(
        width: 60,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 5),
              blurRadius: 5,
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.asset(
            brand.brandImageRoute,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

class _SelectedBrand extends StatelessWidget {
  const _SelectedBrand({Key? key, required this.brand}) : super(key: key);

  final Brand brand;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 130,
      padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: const Color(0xFFfaa504),
      ),
      child: Row(
        children: [
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                brand.brandImageRoute,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            brand.brandName,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
