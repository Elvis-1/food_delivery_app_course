import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_delivery/data/repository/popular_product_repo.dart';
import 'package:food_delivery/models/product_model.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:get/get.dart';
import 'dart:ui';

class PopularProductController extends GetxController {
  PopularProductRepo popularProductRepo;

  PopularProductController({required this.popularProductRepo});

  List<ProductModel> _popularProductList = [];
  List<ProductModel> get popularProductList => _popularProductList;

  int _quantity = 0;
  int get quantity => _quantity;

  int _inCartItems = 0;

  int get inCartItems => _inCartItems + _quantity;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.GetPopularProductList();
    final extract = response.body as Map<String, dynamic>;
    // print(extract);
    print(extract['data']);
    final extractedData = extract['data'] as List;
    // print(extractedData);
    if (response.statusCode == 200) {
      _popularProductList = [];

      extractedData.forEach((
        element,
      ) {
        print('The IMAGE' + element['products']['image']);
        _popularProductList.add(ProductModel(
            id: element['products']['id'],
            name: element['products']['name'],
            description: element['products']['description'],
            price: element['products']['price'],
            stars: element['products']['stars'],
            img: element['products']['image'],
            location: element['products']['location'],
            typeId: element['product_id']));
      });
      // print(_popularProductList);
      // print('empty' + _popularProductList.last.name!);
      _isLoaded = true;
      update();
      print('Working');
    } else {
      print('Not Working');
    }
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
      // print('increment ' + _quantity.toString());
    } else {
      _quantity = checkQuantity(_quantity - 1);
      print('decrement ' + _quantity.toString());
    }
    update();
  }

  int checkQuantity(int quantity) {
    if (quantity < 0) {
      Get.snackbar(
        "Item Count",
        "You can't reduce more!",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 0;
    } else if (quantity > 20) {
      Get.snackbar(
        "Item Count",
        "You can't add more!",
        backgroundColor: AppColors.mainColor,
        colorText: Colors.white,
      );
      return 20;
    } else {
      return quantity;
    }
    update();
  }

  void initProduct() {
    _quantity = 0;
    _inCartItems = 0;
  }
}
