import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var subcat = [];

  getSubCategories(title) async {
    var data = await rootBundle.loadString("lib/services/category_model.json");
  }
}
