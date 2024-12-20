import 'package:fashionista/app/modules/home/controllers/home_controller.dart';
import 'package:fashionista/app/modules/home/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class AddProductView extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();

  final TextEditingController imageUrlController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
        backgroundColor: const Color(0xFF003366),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: imageUrlController,
              decoration: const InputDecoration(labelText: 'Image URL'),
            ),
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Product Title'),
            ),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(labelText: 'Product Price'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final newProduct = Product(
                  imageUrl: imageUrlController.text,
                  title: titleController.text,
                  price: priceController.text,
                );
                controller.addProduct(newProduct);
                Get.snackbar(
                  'Success',
                  'Product added!',
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: const Color(0xFF003366),
                  colorText: Colors.white,
                );
                Navigator.pop(context); // Go back after adding the product
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF003366),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Add Product',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
