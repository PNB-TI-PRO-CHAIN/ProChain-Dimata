import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  var categories = <String>[].obs; 
  var subCategories = <String>[].obs; 
  var filteredCategories = <String>[].obs; 
  var filteredSubCategories = <String>[].obs; 
  var isEmpty = true.obs;
  var isHidden = false.obs;
  var selectedType = ''.obs;
  

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    filteredCategories.assignAll(categories);
    filteredSubCategories.assignAll(subCategories); 
  }

  void search(String query) {
    filteredCategories.assignAll(
      categories.where((category) => category.toLowerCase().contains(query.toLowerCase())),
    );
    filteredSubCategories.assignAll(
      subCategories.where((subCategory) => subCategory.toLowerCase().contains(query.toLowerCase())),
    );
    checkIfEmpty();
  }

  void checkIfEmpty() {
    if (filteredCategories.isEmpty && filteredSubCategories.isEmpty) {
      isEmpty.value = true;
    } else {
      isEmpty.value = false;
    }
  }

  void toggleVisibility() {
    isHidden.value = !isHidden.value;
  }
}
