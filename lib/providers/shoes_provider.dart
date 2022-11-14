import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_shoes_app/models/shoe_model.dart';
import 'package:flutter_shoes_app/helpers/shoes_lists.dart';

class ShoesProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isLoadingArrivals = false;
  //- Shoes
  final String _key = 'YOUR-TOKEN';
  final String _host = 'shoes-collections.p.rapidapi.com';
  final String _baseUrl = 'shoes-collections.p.rapidapi.com';
  List<ShoeModel> shoesList = [];
  List<ShoeModel> newArrivals = [];
  //- Category
  String _category = 'Men';

  ShoesProvider() {
    getShoes(_brand);
    getNewArrivals();
  }

  get getCategory => _category;

  set setCategory(String value) {
    _category = value;
    isLoading = true;
    notifyListeners();
    _delayLoading();
  }

  //- Brand
  String _brand = 'Nike';

  get getBrand => _brand;

  set setBrand(String value) {
    _brand = value;
    getShoes(value);
    isLoading = true;
    notifyListeners();
    _delayLoading();
  }

  String _brandRoute = 'assets/nike.png';

  get getBrandRoute => _brandRoute;

  set setBrandRoute(String value) {
    _brandRoute = value;
  }

  //- Functions

  _delayLoading() {
    Future.delayed(const Duration(seconds: 3), () {
      isLoading = false;
      notifyListeners();
    });
  }

  getShoes(String brand) {
    shoesList.clear();
    shoesList = [...?shoes[brand]];
  }

  Future getNewArrivals() async {
    isLoadingArrivals = true;
    notifyListeners();
    final url = Uri.https(_baseUrl, 'shoes');
    final response = await http.get(
      url,
      headers: {'X-RapidAPI-Key': _key, 'X-RapidAPI-Host': _host},
    );
    final responseBody = json.decode(response.body);
    if (response.statusCode == 200) {
      for (final Map<String, dynamic> res in responseBody) {
        newArrivals.add(ShoeModel.fromMap(res));
      }
    }
    isLoadingArrivals = false;
    notifyListeners();
  }
}
