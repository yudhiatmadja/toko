import 'package:fashionista/app/modules/home/models/product_model.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class HomeController extends GetxController {
  var productList = <Product>[].obs;

  // Function to add product and save to local storage
  Future<void> addProduct(Product product) async {
    // Save the product to local storage
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> products = prefs.getStringList('products') ?? [];

    // Add the new product to the list
    products.add(json.encode(product.toMap()));

    // Save the updated list back to local storage
    await prefs.setStringList('products', products);

    // Load the updated product list
    loadProducts();
  }

  // Function to load products from local storage
  Future<void> loadProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> products = prefs.getStringList('products') ?? [];

    // Convert the saved products back to Product objects
    productList.value = products
        .map((productData) =>
            Product.fromMap(json.decode(productData) as Map<String, dynamic>))
        .toList();
  }
}
