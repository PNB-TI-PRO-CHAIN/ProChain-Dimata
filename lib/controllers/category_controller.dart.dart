import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  var categories = <String>[].obs;  // List untuk kategori
  var subCategories = <String>[].obs; // List untuk sub kategori
  var isEmpty = true.obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
  }

  // Fungsi untuk memeriksa apakah data kosong atau tidak
  void checkIfEmpty() {
    if (categories.isEmpty && subCategories.isEmpty) {
      isEmpty.value = true;
    } else {
      isEmpty.value = false;
    }
  }
}
